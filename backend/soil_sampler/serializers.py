# serializers.py
import hashlib
from django.db import models
from rest_framework import serializers
from rest_framework_simplejwt.tokens import RefreshToken
from django.contrib.auth import get_user_model
from .models import (
    Captcha,
    Sample,
    SampleTest,
    Station,
    SampleStationLocator,
    StationMaster,
    UploadedFile,
)

User = get_user_model()


class StationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Station
        fields = ["id", "name", "is_storage_center"]


class StationMasterSerializer(serializers.ModelSerializer):
    station = StationSerializer()

    class Meta:
        model = StationMaster
        fields = ("station",)


class UserSerializer(serializers.ModelSerializer):
    password = serializers.CharField(write_only=True)
    email = serializers.EmailField(write_only=True)
    station_master = StationMasterSerializer(read_only=True)

    class Meta:
        model = User
        fields = (
            "id",
            "name",
            "email",
            "password",
            "is_active",
            "is_staff",
            "can_view",
            "station_master",
        )

    def create(self, validated_data):
        """
        Save user with hashed password.
        """
        user = User.objects.create_user(
            email=validated_data["email"],
            password=validated_data["password"],
            name=validated_data["name"],
        )

        return user


class CustomTokenObtainPairSerializer(serializers.Serializer):
    username_or_email = serializers.CharField()
    password = serializers.CharField(
        style={"input_type": "password"}, trim_whitespace=True
    )

    def validate(self, attrs):
        username_or_email = attrs.get("username_or_email")
        password = attrs.get("password")

        # Try to authenticate with username or email
        user = User.objects.filter(
            models.Q(username=username_or_email) | models.Q(
                email=username_or_email)
        ).first()

        if user and user.check_password(password):
            refresh = RefreshToken.for_user(user)
            data = {
                "refresh": str(refresh),
                "access": str(refresh.access_token),
            }
            return data

        raise serializers.ValidationError("Invalid credentials")


class CaptchaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Captcha
        fields = "__all__"


class SampleSerializer(serializers.ModelSerializer):
    current_station = serializers.SerializerMethodField()
    class Meta:
        model = Sample
        exclude = ["updated_at", "hash_value"]
        read_only_fields = ["id", "created_at"]

    def get_current_station(self, obj):
        return SampleStationLocatorSerializer(SampleStationLocator.objects.filter(sample_id=obj.id).first()).data
    

class SampleStationLocatorSerializer(serializers.ModelSerializer):
    station_name = serializers.SerializerMethodField()
    user_name = serializers.SerializerMethodField()

    class Meta:
        model = SampleStationLocator
        fields = [
            "id",
            "user",
            "user_name",
            "sample_id",
            "station_id",
            "station_name",
            "is_completed",
            'is_dispatched',
            "created_at",
        ]
        read_only_fields = ["id"]
        extra_kwargs = {
            # "sample_id": {"write_only": True},
            "user": {"write_only": True},
        }

    def get_station_name(self, obj):
        return obj.station_id.name if obj.station_id else None

    def get_user_name(self, obj):
        return obj.user.name if obj.user else None


class SampleTestSerializer(serializers.ModelSerializer):
    class Meta:
        model = SampleTest
        fields = [
            "id",
            "sample_station_locator_id",
            "remarks",
            "is_completed",
            "created_at",
            "updated_at",
        ]
        read_only_fields = ["id"]
        extra_kwargs = {"sample_station_locator_id": {"write_only": True}}
    
class UploadedFileSerializer(serializers.ModelSerializer):

    class Meta:
        model = UploadedFile
        fields = ['id', 'file', 'user', 'created_at']
