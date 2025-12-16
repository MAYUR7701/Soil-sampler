from django.contrib.auth.models import (
    AbstractBaseUser,
    BaseUserManager,
    PermissionsMixin,
)
from django.db import models
from django.utils import timezone
import uuid
from django.db.models import Q
from .utils.hash_generator import generate_hash


# Custom User Model  support for email and password authentication
class UserManager(BaseUserManager):
    def create_user(self, email, password=None, **extra_fields):
        if not email:
            raise ValueError("The Email field must be set")
        if not password:
            raise ValueError("The Password field must be set")
        email = self.normalize_email(email)
        user = self.model(email=email, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, password=None, **extra_fields):
        extra_fields.setdefault("is_staff", True)
        extra_fields.setdefault("is_superuser", True)
        return self.create_user(email, password, **extra_fields)


class User(AbstractBaseUser, PermissionsMixin):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    email = models.EmailField(unique=True)
    name = models.CharField(max_length=500, blank=False, null=False)
    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)
    can_view = models.BooleanField(default=False)
    date_joined = models.DateTimeField(default=timezone.now)
    created_at = models.DateTimeField(auto_now_add=True, blank=True)
    updated_at = models.DateTimeField(auto_now=True, blank=True)
    objects = UserManager()
    USERNAME_FIELD = "email"
    REQUIRED_FIELDS = ["name", "password"]

    def __str__(self):
        return f"{self.name} - {self.email}"

    class Meta:
        ordering = ["-email"]
        verbose_name_plural = "Users"


    # def save(self, *args, **kwargs):
    #     # Ensure that the password is hashed properly
    #     self.set_password(self.password)

    #     super().save(*args, **kwargs)



# Captcha Model
class Captcha(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    captcha_answer = models.CharField(max_length=6, blank=False, null=False)
    created_at = created_at = models.DateTimeField(auto_now_add=True, blank=True)

    class Meta:
        ordering = ["-created_at"]

    def __str__(self):
        return f"{self.id}: {self.captcha_answer}"


# Station model
class Station(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    name = models.CharField(max_length=50, blank=False, unique=True)
    is_storage_center= models.BooleanField(default=False, blank=False, null=False)
    created_at = models.DateTimeField(auto_now_add=True, blank=True)
    updated_at = models.DateTimeField(auto_now=True, blank=True)

    class Meta:
        ordering = ["-created_at"]

    def __str__(self):
        return self.name

class StationMaster(models.Model):
    user = models.OneToOneField(
        User, on_delete=models.CASCADE, primary_key=True, related_name="station_master"
    )
    station = models.OneToOneField(
        Station, on_delete=models.CASCADE, related_name="station_master"
    )

    class Meta:
        ordering = ["-user__date_joined"]

    def __str__(self):
        return f"{self.user.name} {self.station.name}"


# Sample Model
class Sample(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    # sample_no = models.CharField(max_length=8, blank=False, null=False, unique=True,editable=False)
    project_no = models.PositiveIntegerField(blank=False, null=False)
    sample_no = models.CharField(max_length=8, blank=False, null=False)
    location = models.CharField(max_length=50, blank=False, null=False)
    top_depth = models.DecimalField(null=False, blank=False,max_digits=5, decimal_places=3)
    hash_value = models.CharField(max_length=64, blank=True, null=False,unique=True,editable=False)
    is_archived = models.BooleanField(default=False, blank=False, null=False)
    created_at = models.DateTimeField(auto_now_add=True, blank=True)
    updated_at = models.DateTimeField(auto_now=True, blank=True)
    
    def save(self, *args, **kwargs):
        if self.is_archived:
            # Check for incomplete Sample Locators
            incomplete_sample_locators = SampleStationLocator.objects.filter(
                sample_id=self.id, is_completed=False
            )
            if incomplete_sample_locators.exists():
                raise ValueError("All scanned stations must have completed tests")
        last_sample_station_locator = (
            SampleStationLocator.objects.filter(sample_id=self.id)
            .order_by("-created_at")
            .first()
        )
        if last_sample_station_locator:
            if last_sample_station_locator.is_dispatched:
                raise ValueError("Last Sample Locator is dispatched")
        self.hash_value = generate_hash(self.project_no, self.sample_no, self.location, self.top_depth)
        super().save(*args, **kwargs)



    class Meta:
        ordering = ["-created_at"]

    def __str__(self):
        return f"Sample Id: {self.id} => Sample No: {self.sample_no}"   


# Sample Locator Model
class SampleStationLocator(models.Model):
    # Primary key for the model
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    # User associated with the sample station locator
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    # Sample and station foreign keys
    sample_id = models.ForeignKey(Sample, on_delete=models.CASCADE)
    station_id = models.ForeignKey(Station, on_delete=models.CASCADE)
    # Flags indicating completion and dispatch status
    is_completed = models.BooleanField(default=False, blank=False, null=False)
    is_dispatched = models.BooleanField(default=False, blank=False, null=False)
    # Timestamps for creation and last update
    created_at = models.DateTimeField(auto_now_add=True, blank=True)
    updated_at = models.DateTimeField(auto_now=True, blank=True)

    # Custom save method to enforce business logic
    def save(self, *args, **kwargs):
        if self.sample_id.is_archived:
            raise ValueError("Sample is archived")
        # Check if is_dispatched is True before allowing is_archived to be True
        if self.is_dispatched and not self.is_completed:
            raise ValueError("Cannot dispatch unless Sample Locator is complete.")
        # Get all records for the same sample, ordered by creation date
        sample_station_locators = SampleStationLocator.objects.filter(
            sample_id=self.sample_id
        ).order_by("-created_at")
        # Get the last record for the sample
        last_sample_station_locator = sample_station_locators.first()
        if last_sample_station_locator:
            # Exclude the current record when checking previous records
            if last_sample_station_locator.id == self.id:
                sample_station_locators = sample_station_locators.exclude(
                    id=last_sample_station_locator.id
                )
            # Check if any previous records exist and have incomplete dispatch or completion
        if sample_station_locators.filter(
            Q(is_completed=False) | Q(is_dispatched=False)
        ).exists():
            raise ValueError("All previous records must be completed and dispatched")
        if self.is_completed:
            if self.sampletest_set.all().filter(is_completed=False).exists():
                raise ValueError("All Sample Test must be completed")
        # Call the original save method
        super().save(*args, **kwargs)

    class Meta:
        ordering = ["-created_at"]

    # String representation of the object for easier debugging
    def __str__(self):
        return f"{self.sample_id} - Station: {self.station_id} - Completed: {self.is_completed}"


# Sample Tests
class SampleTest(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    sample_station_locator_id = models.ForeignKey(
        SampleStationLocator, on_delete=models.CASCADE
    )
    remarks = models.TextField(blank=True, null=True)
    is_completed = models.BooleanField(default=False, blank=False, null=False)
    created_at = models.DateTimeField(auto_now_add=True, blank=True)
    updated_at = models.DateTimeField(auto_now=True, blank=True)

    def save(self, *args, **kwargs):
        # Check if sample_station_locator_id is False before saving
        if not self.sample_station_locator_id.is_completed:
            super().save(*args, **kwargs)
        else:
            raise ValueError("Current Sample Station Locator is already completed")

    class Meta:
        ordering = ["-created_at"]

    # String representation of the object for easier debugging
    def __str__(self):
        return f"{self.id} - Locator: {self.sample_station_locator_id} Station: {self.sample_station_locator_id.station_id.name} - Completed: {self.is_completed} "



class UploadedFile(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    file = models.FileField(upload_to='excel_files/')
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True, blank=True)
    updated_at = models.DateTimeField(auto_now=True, blank=True)

    def __str__(self):
        return self.file.name

    class Meta:
        ordering = ["-created_at"]
