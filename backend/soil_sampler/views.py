# views.py
from django.views import View
from rest_framework.views import APIView
from rest_framework.response import Response
from django.core.paginator import Paginator
from django.core.paginator import EmptyPage, PageNotAnInteger
from rest_framework import status
from uuid import UUID
from rest_framework.permissions import IsAuthenticated, IsAdminUser
from django.contrib.auth import get_user_model, authenticate, login, logout

from .utils.excel_file_handler import process_excel_file
from .utils.captcha import generate_captcha
from .models import (
    Captcha,
    SampleTest,
    Station,
    SampleStationLocator,
    Sample,
    UploadedFile,
)
from rest_framework_simplejwt.tokens import RefreshToken
from .serializers import (
    SampleTestSerializer,
    UploadedFileSerializer,
    UserSerializer,
    CaptchaSerializer,
    SampleSerializer,
    StationSerializer,
    SampleStationLocatorSerializer,
)
from .custom_auth import CustomJWTAuthentication
from .custom_permissions import CanView, IsStationStaff, IsStorageCenterStaff
from django.db.models import Q
from django.http import Http404, JsonResponse
from django.shortcuts import get_object_or_404
from django.http import Http404
from django.db import transaction
from django.db.models import OuterRef, Subquery
from django.db.models import Max
from .utils.hash_generator import generate_hash

# Get User Model globally
User = get_user_model()


# User Registration
class UserRegistrationAPIView(APIView):
    def post(self, request):
        try:
            # Create a UserSerializer instance with the request data
            serializer = UserSerializer(data=request.data)
            # Check if the serializer is valid before proceeding
            if serializer.is_valid():
                # Save the user and return a success response
                serializer.save()
                return Response(
                    {
                        "status": True,
                        "data": {
                            "message": "User registered successfully",
                        },
                    },
                    status=status.HTTP_201_CREATED,
                )
            # If the serializer is not valid, return an error response
            return Response(
                {"status": False, "errors": serializer.errors},
                status=status.HTTP_400_BAD_REQUEST,
            )
        except Exception as e:
            # Handle any exceptions that might occur during user registration
            return Response(
                {"status": False, "error": str(e)},
                status=status.HTTP_500_INTERNAL_SERVER_ERROR,
            )


# User Login
class UserLoginViewAPIView(APIView):
    def post(self, request):
        try:
            # Get email and password from request data
            email = request.data.get("email", None)
            password = request.data.get("password", None)
            # Validate email and password
            if not email or not password:
                raise ValueError("Email and password are required.")
            # Check captcha
            # captcha_id = request.data.get("captcha_id", None)
            # captcha_text = request.data.get("captcha_answer", None)
            # if not captcha_id or not captcha_text:
            #     return Response(
            #         {"status": False, "error": "Missing Captcha details"}, status=400
            #     )
            # captcha = Captcha.objects.filter(
            #     id=captcha_id, captcha_answer__exact=captcha_text
            # ).first()
            # if not captcha:
            #     return Response(
            #         {"status": False, "error": "Invalid captcha"}, status=400
            #     )
            # captcha.delete()
            # Authenticate user
            user = authenticate(request, email=email, password=password)
            if user is None:
                return Response(
                    {"status": False, "error": "Invalid credentials"},
                    status=status.HTTP_401_UNAUTHORIZED,
                )
            # Log in the admin user
            login(request, user)
            # Generate tokens
            refresh = RefreshToken.for_user(user)
            access_token = str(refresh.access_token)
            response = Response(
                {
                    "status": True,
                    "data": {
                        "message": "Login successful",
                        # "user": serializer.data,
                    },
                }
            )
            # Set the access_token cookie with Path='/'
            response.set_cookie("access_token", access_token, httponly=True, path="/")
            # Set the refresh_token cookie with Path='/api/logout'
            response.set_cookie(
                "refresh_token", str(refresh), httponly=True, path="/api/logout"
            )
            # Return the refresh token in the response body
            return response

        except Exception as e:
            # Handle any exceptions that might occur during login
            return Response(
                {"status": False, "error": str(e)},
                status=status.HTTP_500_INTERNAL_SERVER_ERROR,
            )


# Logout
class UserLogoutViewAPIView(APIView):
    authentication_classes = [CustomJWTAuthentication]
    permission_classes = [IsAuthenticated]

    def post(self, request):
        try:
            refresh_token = request.COOKIES.get("refresh_token")
            if refresh_token:
                logout(request)
                # Create a response
                response = Response(
                    {"status": True, "data": {"message": "Logout successful"}},
                    status=200,
                )
                # Delete all cookies
                for cookie_name in request.COOKIES:
                    response.delete_cookie(cookie_name)
                token = RefreshToken(refresh_token)
                # Blacklist the refresh token
                token.blacklist()
                return response
            else:
                return Response(
                    {"status": False, "error": "Invalid or missing tokens"}, status=400
                )
        except Exception as e:
            return Response({"status": False, "error": str(e)}, status=500)


# Fetch logged in user data
class GetLoggedInUserDataView(APIView):
    authentication_classes = [CustomJWTAuthentication]

    def get(self, request, *args, **kwargs):
        try:
            user = request.user
            # Serialize user data
            serializer = UserSerializer(user)
            return Response(
                {
                    "status": True,
                    "data": {
                        "user": serializer.data,
                    },
                },
                status=status.HTTP_200_OK,
            )
        except Exception as e:
            return Response(
                {
                    "status": False,
                    "error": str(e),
                },
                status=status.HTTP_500_INTERNAL_SERVER_ERROR,
            )


# Generate Captcha
class CaptchaAPIView(APIView):
    # Define the post method for handling POST requests
    def post(self, request):
        try:
            # Delete already existed captcha
            captcha_id = request.data.get("captcha_id", None)
            if captcha_id:
                captcha = Captcha.objects.filter(id=captcha_id).first()
                if captcha:
                    captcha.delete()
            # Generate Captcha ID and Image
            captcha_str, image_base64 = generate_captcha()
            captcha_image_data_url = f"data:image/png;base64,{image_base64}"
            # Create a CaptchaSerializer instance with the generated captcha answer
            serializer = CaptchaSerializer(data={"captcha_answer": captcha_str})
            # Validate and store the captcha ID and answer in the database
            if serializer.is_valid():
                captcha = serializer.save()
                if captcha:
                    # Return a success response with captcha ID and image
                    return Response(
                        {
                            "status": True,
                            "data": {
                                "captcha_id": captcha.id,
                                "captcha": captcha_image_data_url,
                            },
                        },
                        status=status.HTTP_201_CREATED,
                    )
                else:
                    # Return an error response if unable to save captcha
                    return Response(
                        {"status": False, "error": "Unable to save captcha"},
                        status=status.HTTP_400_BAD_REQUEST,
                    )
            else:
                # Return an error response with validation errors
                return Response(
                    {"status": False, "error": serializer.errors},
                    status=status.HTTP_400_BAD_REQUEST,
                )
        except Exception as e:
            # Return an error response if an exception occurs
            return Response(
                {"status": False, "error": str(e)},
                status=status.HTTP_500_INTERNAL_SERVER_ERROR,
            )


class SampleAPIView(APIView):
    authentication_classes = [CustomJWTAuthentication]

    def get_permissions(self):
        if self.request.method == "PUT":
            return [permission() for permission in [IsAdminUser]]
        elif self.request.method == "PUT":
            return [permission() for permission in [IsStorageCenterStaff]]
        return super().get_permissions()

    def post(self, request, *args, **kwargs):
        try:
            # if disptach is True, then add is_completed and is_dispatched as True
            completed = request.data.get("dispatch", False)
            serializer = SampleSerializer(data=request.data)
            if serializer.is_valid():
                # Save the Sample instance
                sample_instance = serializer.save()

                # Create a new SampleStationLocator instance

                sample_locator_data = {
                    "user": request.user.id,
                    "sample_id": sample_instance.id,
                    "station_id": request.user.station_master.station.id,
                }
                if completed:
                    sample_locator_data["is_completed"] = True
                    sample_locator_data["is_dispatched"] = True
                sample_locator_serializer = SampleStationLocatorSerializer(
                    data=sample_locator_data
                )
                if sample_locator_serializer.is_valid():
                    sample_locator_serializer.save()
                    return Response(
                        {
                            "status": True,
                            "data": {
                                "sample": serializer.data,
                                "message": "Sample Created successfully",
                            },
                        },
                        status=status.HTTP_201_CREATED,
                    )
                else:
                    # If SampleStationLocator creation fails, you may want to delete the previously created Sample instance
                    sample_instance.delete()
                    return Response(
                        {"status": False, "error": sample_locator_serializer.errors},
                        status=status.HTTP_400_BAD_REQUEST,
                    )
            else:
                return Response(
                    {"status": False, "error": serializer.errors},
                    status=status.HTTP_400_BAD_REQUEST,
                )
        except Exception as e:
            return Response(
                {"status": False, "error": str(e)},
                status=status.HTTP_500_INTERNAL_SERVER_ERROR,
            )

    def put(self, request, *args, **kwargs):
        try:
            # Get the Sample instance
            sample_id = request.data.get("sample_id", None)
            if not sample_id:
                return Response(
                    {"status": False, "error": "Missing Sample Id"},
                    status=status.HTTP_400_BAD_REQUEST,
                )
            sample_instance = Sample.objects.get(id=sample_id)
            if not sample_instance:
                return Response(
                    {"status": False, "error": "Sample not found"},
                    status=status.HTTP_404_NOT_FOUND,
                )

            serializer = SampleSerializer(
                instance=sample_instance, data=request.data, partial=True
            )
            if serializer.is_valid():
                serializer.save()
                return Response(
                    {
                        "status": True,
                        "data": {
                            "sample": serializer.data,
                            "message": "Sample Updated Successfully",
                        },
                    },
                    status=status.HTTP_200_OK,
                )
            else:
                return Response(
                    {"status": False, "error": serializer.errors},
                    status=status.HTTP_400_BAD_REQUEST,
                )

        except Sample.DoesNotExist:
            return Response(
                {"status": False, "error": "Sample not found"},
                status=status.HTTP_404_NOT_FOUND,
            )
        except Exception as e:
            return Response(
                {"status": False, "error": str(e)},
                status=status.HTTP_500_INTERNAL_SERVER_ERROR,
            )


# Get Sample Details


class GetSampleAPIView(APIView):
    authentication_classes = [CustomJWTAuthentication]
    permission_classes = [CanView]

    def get(self, request, sample_id, **kwargs):
        try:
            # Fetch the Sample instance for the given sample_id
            try:
                sample_id_uuid = UUID(sample_id)
            except ValueError:
                return Response(
                    {"status": False, "error": "Invalid UUID format for sample_id"},
                    status=status.HTTP_400_BAD_REQUEST,
                )

            sample = Sample.objects.get(id=sample_id_uuid)

            serializer = SampleSerializer(sample)

            # Return the serialized data in the response
            return Response(
                {"status": True, "data": serializer.data}, status=status.HTTP_200_OK
            )
        except Sample.DoesNotExist:
            return Response(
                {"status": False, "error": "Sample not found"},
                status=status.HTTP_404_NOT_FOUND,
            )
        except Exception as e:
            return Response(
                {"status": False, "error": str(e)},
                status=status.HTTP_500_INTERNAL_SERVER_ERROR,
            )


class FetchSampleAPIView(APIView):
    authentication_classes = [CustomJWTAuthentication]
    permission_classes = [CanView]

    def get(self, request, *args, **kwargs):
        try:
            # Get the search query from the URL parameters
            search_query = self.request.query_params.get("q", None)

            # If no search query is provided, return an error response
            if not search_query:
                return Response(
                    {"status": False, "error": "Search query not provided"},
                    status=status.HTTP_400_BAD_REQUEST,
                )

            # Build the query based on the search query
            query = (
                # Q(id__icontains=search_query) |
                Q(sample_no__icontains=search_query)
                | Q(location__icontains=search_query)
            )

            # Query the samples
            samples = Sample.objects.filter(query)

            # Paginate the results
            paginator = Paginator(samples, 10)  # Show 10 samples per page
            page = self.request.query_params.get("page", 1)
            try:
                samples_paginated = paginator.page(page)
            except PageNotAnInteger:
                samples_paginated = paginator.page(1)
            except EmptyPage:
                samples_paginated = paginator.page(paginator.num_pages)

            # Serialize the paginated data
            serializer = SampleSerializer(samples_paginated, many=True)

            # Return the paginated and serialized data
            return Response(
                {
                    "status": True,
                    "data": serializer.data,
                    "pagination": {
                        "current_page": samples_paginated.number,
                        "total_pages": paginator.num_pages,
                        "total_items": paginator.count,
                    },
                },
                status=status.HTTP_200_OK,
            )

        except Exception as e:
            return Response(
                {"status": False, "error": str(e)},
                status=status.HTTP_500_INTERNAL_SERVER_ERROR,
            )


class ScanSampleAPIView(APIView):
    authentication_classes = [CustomJWTAuthentication]
    permission_classes = [IsStationStaff]

    def get_permissions(self):
        if self.request.method == "POST":
            return [permission() for permission in [CanView]]
        return super().get_permissions()

    def post(self, request, *args, **kwargs):
        try:
            sample_id = request.data.get("sample_id", None)
            auto_acquire = request.data.get("autoAcquire", False)
            auto_generate = request.data.get("autoGenerate", False)
            project_no = request.data.get("project_no", None)
            sample_no = request.data.get("sample_no", None)
            location = request.data.get("location", None)
            top_depth = request.data.get("top_depth", None)
            completed = request.data.get("dispatch", False)
            sample = None
            if sample_id:
                try:
                    uuid_sample_id = UUID(sample_id)
                except ValueError:
                    return Response(
                        {"status": False, "error": "Invalid Input"},
                        status=status.HTTP_400_BAD_REQUEST,
                    )
                sample = Sample.objects.filter(id=uuid_sample_id).first()
                print(sample)
                if not sample:
                    return Response(
                        {"status": False, "error": "Sample not found"},
                        status=status.HTTP_404_NOT_FOUND,
                    )

            elif project_no and sample_no and location and top_depth:
                hash_value = generate_hash(project_no, sample_no, location, top_depth)
                sample_instance = Sample.objects.filter(hash_value=hash_value).first()
                if sample_instance:
                    sample = sample_instance
            if sample:
                if not (
                    hasattr(request.user, "station_master")
                    and request.user.station_master is not None
                ):
                    sample_serializer = SampleSerializer(sample)
                    return Response(
                        {
                            "status": True,
                            "data": {
                                "sample": sample_serializer.data,
                            },
                        }
                    )
                if auto_acquire:

                    # Generate Sample
                    sample_locator_data = {
                        "user": request.user.id,
                        "sample_id": sample.id,
                        "station_id": request.user.station_master.station.id,
                    }
                    sample_locator_serializer = SampleStationLocatorSerializer(
                        data=sample_locator_data
                    )
                    if sample_locator_serializer.is_valid():
                        sample_locator_serializer.save()
                        sample_serializer = SampleSerializer(sample)
                        return Response(
                            {
                                "status": True,
                                "data": {
                                    "message": "Scan completed successfully",
                                    "sample": sample_serializer.data,
                                },
                            },
                            status=status.HTTP_201_CREATED,
                        )
                    else:
                        return Response(
                            {
                                "status": False,
                                "error": sample_locator_serializer.errors,
                            },
                            status=status.HTTP_400_BAD_REQUEST,
                        )
                else:
                    sample_serializer = SampleSerializer(sample)
                    return Response(
                        {
                            "status": True,
                            "data": {
                                "sample": sample_serializer.data,
                            },
                        },
                        status=status.HTTP_200_OK,
                    )

            elif auto_generate:
                # Generate Sample
                if not (
                    hasattr(request.user, "station_master")
                    and request.user.station_master.station.is_storage_center
                    is not None
                ):
                    return Response(
                        {
                            "status": False,
                            "error": "Sample can only be generated at storage center",
                        },
                        status=status.HTTP_400_BAD_REQUEST,
                    )
                # if disptach is True, then add is_completed and is_dispatched as True
                serializer = SampleSerializer(data=request.data)
                if serializer.is_valid():
                    # Save the Sample instance
                    sample_instance = serializer.save()

                    # Create a new SampleStationLocator instance

                    sample_locator_data = {
                        "user": request.user.id,
                        "sample_id": sample_instance.id,
                        "station_id": request.user.station_master.station.id,
                    }
                    if completed:
                        sample_locator_data["is_completed"] = True
                        sample_locator_data["is_dispatched"] = True
                    sample_locator_serializer = SampleStationLocatorSerializer(
                        data=sample_locator_data
                    )
                    if sample_locator_serializer.is_valid():
                        sample_locator_serializer.save()
                        sample_serializer = SampleSerializer(sample_instance)
                        return Response(
                            {
                                "status": True,
                                "data": {
                                    "sample": sample_serializer.data,
                                    "message": "Sample Created successfully",
                                    "isNew": True,
                                },
                            },
                            status=status.HTTP_201_CREATED,
                        )
                    else:
                        # If SampleStationLocator creation fails, you may want to delete the previously created Sample instance
                        sample_instance.delete()
                        return Response(
                            {
                                "status": False,
                                "error": sample_locator_serializer.errors,
                            },
                            status=status.HTTP_400_BAD_REQUEST,
                        )
                else:
                    return Response(
                        {"status": False, "error": serializer.errors},
                        status=status.HTTP_400_BAD_REQUEST,
                    )
            return Response(
                {"status": False, "error": "No valid options opted"},
                status=status.HTTP_400_BAD_REQUEST,
            )
        except Exception as e:
            return Response(
                {"status": False, "error": str(e)},
                status=status.HTTP_500_INTERNAL_SERVER_ERROR,
            )

    def put(self, request, *args, **kwargs):
        try:
            sample_station_locator_id = request.data.get("sample_station_locator_id")
            is_completed = request.data.get("is_completed", False)
            is_dispatched = request.data.get("is_dispatched", False)
            if not sample_station_locator_id:
                return Response(
                    {"status": False, "error": "Sample locator ID not provided"},
                    status=status.HTTP_400_BAD_REQUEST,
                )
            try:
                sample_station_locator = SampleStationLocator.objects.get(
                    id=sample_station_locator_id
                )
            except SampleTest.DoesNotExist:
                return Response(
                    {"status": False, "error": "Sample Station Locator not found"},
                    status=status.HTTP_404_NOT_FOUND,
                )
            if sample_station_locator:
                if (
                    request.user.station_master.station.id
                    != sample_station_locator.station_id.id
                ):
                    return Response(
                        {"status": False, "error": "Permission denied"},
                        status=status.HTTP_403_FORBIDDEN,
                    )
            if is_completed and sample_station_locator.is_completed is False:
                sample_station_locator.is_completed = True
            elif is_completed and sample_station_locator.is_completed is True:
                return Response(
                    {
                        "status": False,
                        "error": "Sample Station locator already completed",
                    },
                    status=status.HTTP_400_BAD_REQUEST,
                )
            if is_dispatched and sample_station_locator.is_dispatched is False:
                sample_station_locator.is_dispatched = True
            elif is_dispatched and sample_station_locator.is_dispatched is True:
                return Response(
                    {
                        "status": False,
                        "error": "Sample Station locator already dispatched",
                    },
                    status=status.HTTP_400_BAD_REQUEST,
                )
            sample_station_locator.save()
            return Response(
                {
                    "status": True,
                    "data": {"message": "Sample updated successfully"},
                },
                status=status.HTTP_200_OK,
            )
        except Exception as e:
            return Response(
                {"status": False, "error": str(e)},
                status=status.HTTP_500_INTERNAL_SERVER_ERROR,
            )


class LocateSampleAPIView(APIView):
    authentication_classes = [CustomJWTAuthentication]
    permission_classes = [IsStationStaff]

    def get_permissions(self):
        if self.request.method == "GET":
            return [permission() for permission in [CanView]]
        return super().get_permissions()

    def get(self, request, id, **kwargs):
        try:
            # Check if the 'filter' parameter is present and has the value 'last'
            filter_param = request.query_params.get("filter", None)

            if filter_param and filter_param.lower() == "last":
                # Fetch the last SampleStationLocator instance for the given sample_id
                last_sample_station_locator = (
                    SampleStationLocator.objects.filter(sample_id=id)
                    .order_by("-created_at")
                    .first()
                )

                if not last_sample_station_locator:
                    return Response(
                        {"status": False, "error": "No Sample Station Locator found"},
                        status=status.HTTP_404_NOT_FOUND,
                    )

                # Serialize the instance using the serializer
                serializer = SampleStationLocatorSerializer(last_sample_station_locator)

                # Return the serialized data in the response
                return Response(
                    {"status": True, "sampleLocation": serializer.data},
                    status=status.HTTP_200_OK,
                )
            elif filter_param and filter_param.lower() == "all":

                # Fetch all SampleStationLocator instances for the given sample_id
                sample_station_locators = SampleStationLocator.objects.filter(
                    sample_id=id
                )

                if not sample_station_locators.exists():
                    return Response(
                        {"status": False, "error": "No Sample Station Locators found"},
                        status=status.HTTP_404_NOT_FOUND,
                    )

                # Serialize the instances using the serializer
                serializer = SampleStationLocatorSerializer(
                    sample_station_locators, many=True
                )

                # Return the serialized data in the response
                return Response(
                    {"status": True, "sampleLocations": serializer.data},
                    status=status.HTTP_200_OK,
                )
            else:
                # Check if a SampleStationLocator with the given id exists
                sample_station_locator = SampleStationLocator.objects.filter(
                    id=id
                ).first()

                if not sample_station_locator:
                    return Response(
                        {"status": False, "error": "Sample Station Locator not found"},
                        status=status.HTTP_404_NOT_FOUND,
                    )

                # Serialize the instance using the serializer
                serializer = SampleStationLocatorSerializer(sample_station_locator)

                # Return the serialized data in the response
                return Response(
                    {"status": True, "sampleLocation": serializer.data},
                    status=status.HTTP_200_OK,
                )

        except Exception as e:
            return Response(
                {"status": False, "error": str(e)},
                status=status.HTTP_500_INTERNAL_SERVER_ERROR,
            )

    def put(self, request, id, **kwargs):
        try:
            # Check if the 'is_completed' parameter is present in the request data
            is_completed = request.data.get("is_completed", None)

            if is_completed is None:
                return Response(
                    {
                        "status": False,
                        "error": "Missing 'is_completed' parameter in request data",
                    },
                    status=status.HTTP_400_BAD_REQUEST,
                )

            # Fetch the SampleStationLocator instance with the given id
            sample_station_locator = SampleStationLocator.objects.filter(id=id).first()

            if not sample_station_locator:
                return Response(
                    {"status": False, "error": "Sample Station Locator not found"},
                    status=status.HTTP_404_NOT_FOUND,
                )
                # Serialize the updated instance using the serializer
            serializer = SampleStationLocatorSerializer(sample_station_locator)
            # Validating that the station of the logged-in user matches the station in SampleStationLocator
            if (
                request.user.station_master.station.id
                != sample_station_locator.station_id.id
            ):
                return Response(
                    {"status": False, "error": "Access denied"},
                    status=status.HTTP_403_FORBIDDEN,
                )

            # Update the 'is_completed' field and save the instance
            sample_station_locator.is_completed = is_completed
            sample_station_locator.save()

            # Serialize the updated instance using the serializer
            serializer = SampleStationLocatorSerializer(sample_station_locator)

            # Return the serialized data in the response
            return Response(
                {
                    "status": True,
                    "sampleLocation": serializer.data,
                    "message": "Sample Tests Completed",
                },
                status=status.HTTP_200_OK,
            )

        except Exception as e:
            return Response(
                {"status": False, "error": str(e)},
                status=status.HTTP_500_INTERNAL_SERVER_ERROR,
            )


class SampleStationLocatorAPIView(APIView):
    authentication_classes = [CustomJWTAuthentication]
    permission_classes = [CanView]

    def post(self, request):
        try:
            # Extract parameters from request.data
            location = request.data.get("location", "")
            top_depth = request.data.get("top_depth", "")
            sample_no = request.data.get("sample_no", "")
            is_archived = request.data.get("is_archived", None)
            project_no = request.data.get("project_no", "")
            selected_stations = request.data.get("selectedStations", [])
            last_locations = request.data.get("lastLocations", [])
            page = request.data.get("page", 1)

            # Fetch SampleStationLocator instances based on selected stations
            sample_station_locators = SampleStationLocator.objects.all()
            if selected_stations:
                sample_station_locators = sample_station_locators.filter(
                    station_id__in=selected_stations
                )

            # Fetch all samples with the obtained sample IDs
            samples = Sample.objects.filter(
                id__in=sample_station_locators.values_list("sample_id", flat=True)
            )

            # Build the query for filtering samples
            query = (
                Q(location__icontains=location)
                & Q(project_no__icontains=project_no)
                & Q(sample_no__icontains=sample_no)
                & Q(top_depth__icontains=top_depth)
            )

            # Apply the query to filter samples

            samples = samples.filter(query)
            # Filter samples based on is_archived
            if is_archived in [True, False]:
                samples = samples.filter(is_archived=is_archived)
            if last_locations:
                # Get the latest SampleStationLocator for each sample id
                last_location_samples = SampleStationLocator.objects.filter(
                    station_id__in=last_locations,
                    sample_id__in=samples.values_list("id", flat=True),
                    created_at=Subquery(
                        SampleStationLocator.objects.filter(
                            sample_id=OuterRef("sample_id")
                        )
                        .order_by("-created_at")
                        .values("created_at")[:1]
                    ),
                )
                samples = samples.filter(
                    id__in=last_location_samples.values_list("sample_id", flat=True)
                )
            paginator = Paginator(samples, 10)  # Show 10 samples per page
            try:
                samples_paginated = paginator.page(page)
            except PageNotAnInteger:
                samples_paginated = paginator.page(1)
            except EmptyPage:
                samples_paginated = paginator.page(paginator.num_pages)
            serializer = SampleSerializer(samples_paginated, many=True)
            # Return the paginated and serialized data
            return Response(
                {
                    "status": True,
                    "data": serializer.data,
                    "pagination": {
                        "current_page": samples_paginated.number,
                        "total_pages": paginator.num_pages,
                        "total_items": paginator.count,
                    },
                },
                status=status.HTTP_200_OK,
            )

        except Http404:
            return Response(
                {"status": False, "error": "No samples found"},
                status=status.HTTP_404_NOT_FOUND,
            )
        except Exception as e:
            return Response(
                {"error": str(e)},
                status=status.HTTP_500_INTERNAL_SERVER_ERROR,
            )


class DispatchSampleAPIView(APIView):
    authentication_classes = [CustomJWTAuthentication]
    permission_classes = [IsStationStaff]

    def put(self, request, *args, **kwargs):
        try:
            # Extracting data from the request
            sample_station_locator_id = request.data.get("sample_station_locator_id")

            # Validating UUID
            try:
                sample_station_locator_id_uuid = UUID(sample_station_locator_id)
            except ValueError:
                return Response(
                    {"status": False, "error": "Invalid UUID"},
                    status=status.HTTP_400_BAD_REQUEST,
                )

            # Fetching the SampleStationLocator instance or returning 404 if not found
            sample_station_locator = get_object_or_404(
                SampleStationLocator, id=sample_station_locator_id_uuid
            )

            # Validating that the station of the logged-in user matches the station in SampleStationLocator
            if (
                request.user.station_master.station.id
                != sample_station_locator.station_id.id
            ):
                return Response(
                    {"status": False, "error": "Access denied"},
                    status=status.HTTP_403_FORBIDDEN,
                )

            # Checking if SampleStationLocator is already dispatched
            if sample_station_locator.is_dispatched:
                return Response(
                    {
                        "status": False,
                        "error": "Sample Station Locator is already dispatched",
                    },
                    status=status.HTTP_400_BAD_REQUEST,
                )

            # Performing the update in a transaction to ensure consistency
            with transaction.atomic():
                # Updating is_dispatched to True
                sample_station_locator.is_dispatched = True
                sample_station_locator.save()

            return Response(
                {"status": True, "data": {"message": "Sample dispatched successfully"}},
                status=status.HTTP_200_OK,
            )

        except Http404:
            return Response(
                {"status": False, "error": "Sample Station Locator not found"},
                status=status.HTTP_404_NOT_FOUND,
            )

        except Exception as e:
            return Response(
                {"status": False, "error": str(e)},
                status=status.HTTP_500_INTERNAL_SERVER_ERROR,
            )


class StationAPIView(APIView):
    authentication_classes = [CustomJWTAuthentication]
    permission_classes = [IsAdminUser]

    def get_permissions(self):
        if self.request.method == "GET":
            return [permission() for permission in [CanView]]
        return super().get_permissions()

    def post(self, request):
        try:
            serializer = StationSerializer(data=request.data)
            if serializer.is_valid():
                serializer.save()
                return Response(serializer.data, status=status.HTTP_201_CREATED)
            else:
                return Response(
                    {"status": False, "error": serializer.errors},
                    status=status.HTTP_400_BAD_REQUEST,
                )
        except Exception as e:
            return Response(
                {"status": False, "error": str(e)},
                status=status.HTTP_500_INTERNAL_SERVER_ERROR,
            )

    def get(self, request, *args, **kwargs):
        try:
            stations = Station.objects.all()
            serializer = StationSerializer(stations, many=True)
            return Response(
                {"status": True, "data": serializer.data}, status=status.HTTP_200_OK
            )
        except Exception as e:
            return Response(
                {"status": False, "error": str(e)},
                status=status.HTTP_500_INTERNAL_SERVER_ERROR,
            )


class SampleTestAPIView(APIView):
    authentication_classes = [CustomJWTAuthentication]
    permission_classes = [IsStationStaff]

    def get_permissions(self):
        if self.request.method == "GET":
            return [permission() for permission in [CanView]]
        return super().get_permissions()

    def post(self, request, *args, **kwargs):
        try:
            sample_station_locator_id = request.data.get(
                "sample_station_locator_id", None
            )
            if sample_station_locator_id:
                sample_station_locator = SampleStationLocator.objects.filter(
                    id=sample_station_locator_id,
                    # station_id=request.user.station_master.station.id,
                ).first()
                if sample_station_locator:
                    if (
                        request.user.station_master.station.id
                        != sample_station_locator.station_id.id
                    ):
                        return Response(
                            {"status": False, "error": "Permission denied"},
                            status=status.HTTP_403_FORBIDDEN,
                        )
                    remarks = request.data.get("remarks", None)
                    serializer = SampleTestSerializer(
                        data={
                            "sample_station_locator_id": sample_station_locator_id,
                            "remarks": remarks,
                        }
                    )
                    if serializer.is_valid():
                        serializer.save()
                        return Response(
                            {
                                "status": True,
                                "data": {
                                    "message": "Sample Test created successfully",
                                    "sampleTest": serializer.data,
                                },
                            },
                            status=status.HTTP_201_CREATED,
                        )
                    return Response(
                        {"status": False, "error": serializer.errors},
                        status=status.HTTP_400_BAD_REQUEST,
                    )
                else:
                    return Response(
                        {
                            "status": False,
                            "error": "Station Locator Id not found",
                        },
                        status=status.HTTP_400_BAD_REQUEST,
                    )
            else:
                return Response(
                    {"status": False, "error": "Missing Station Locator Id"},
                    status=status.HTTP_400_BAD_REQUEST,
                )

        except Exception as e:
            return Response(
                {"status": False, "error": str(e)},
                status=status.HTTP_500_INTERNAL_SERVER_ERROR,
            )

    def put(self, request, *args, **kwargs):
        # try:
        # Get sample_test_id from the request body
        sample_test_id = request.data.get("sample_test_id")
        # Check if sample_test_id is provided
        if not sample_test_id:
            return Response(
                {"status": False, "error": "Missing Sample Test Id"},
                status=status.HTTP_400_BAD_REQUEST,
            )
        # Try to get the existing SampleTest instance
        try:
            sample_test = SampleTest.objects.get(id=sample_test_id)
        except SampleTest.DoesNotExist:
            return Response(
                {"status": False, "error": "Sample Test not found"},
                status=status.HTTP_404_NOT_FOUND,
            )
        # Check if the user has permission to update this instance
        if (
            request.user.station_master.station.id
            != sample_test.sample_station_locator_id.station_id.id
        ):
            return Response(
                {"status": False, "error": "Permission denied"},
                status=status.HTTP_403_FORBIDDEN,
            )
        # Update the fields
        remarks = request.data.get("remarks", None)
        is_completed = request.data.get("is_completed", False)
        if remarks is not None:
            sample_test.remarks = remarks
        if is_completed is not None:
            sample_test.is_completed = is_completed
        # Validate and save the instance
        serializer = SampleTestSerializer(
            instance=sample_test, data=request.data, partial=True
        )
        if serializer.is_valid():
            serializer.save()
            return Response(
                {
                    "status": True,
                    "data": {
                        "message": "Sample Test updated successfully",
                        "sampleTest": serializer.data,
                    },
                },
                status=status.HTTP_200_OK,
            )
        return Response(
            {"status": False, "error": serializer.errors},
            status=status.HTTP_400_BAD_REQUEST,
        )

    def get(self, request, *args, **kwargs):
        try:
            sample_tests = None
            # Get sample_station_locator_id from the query parameters
            sample_station_locator_id = request.query_params.get(
                "sample_station_locator_id", None
            )

            if not sample_station_locator_id:
                return Response(
                    {
                        "status": False,
                        "error": "Missing sample_station_locator_id parameter",
                    },
                    status=status.HTTP_400_BAD_REQUEST,
                )

            # Validate whether sample_station_locator_id is a valid UUID
            try:
                uuid_sample_station_locator_id = UUID(sample_station_locator_id)
            except ValueError:
                return Response(
                    {"status": False, "error": "Invalid UUID"},
                    status=status.HTTP_400_BAD_REQUEST,
                )
            is_completed_param = request.query_params.get("is_completed", None)
            if is_completed_param:
                if is_completed_param.lower() == "true":
                    sample_tests = SampleTest.objects.filter(
                        sample_station_locator_id=uuid_sample_station_locator_id,
                        is_completed=True,
                    )
                elif is_completed_param.lower() == "false":
                    sample_tests = SampleTest.objects.filter(
                        sample_station_locator_id=uuid_sample_station_locator_id,
                        is_completed=False,
                    )
            else:
                # Query the SampleTest instances based on sample_station_locator_id
                sample_tests = SampleTest.objects.filter(
                    sample_station_locator_id=uuid_sample_station_locator_id
                )
            # paginator = Paginator(sample_tests, 10)  # Show 10 samples per page
            # page = self.request.query_params.get("page", 1)
            # try:
            #     samples_tests_paginated = paginator.page(page)
            # except PageNotAnInteger:
            #     samples_tests_paginated = paginator.page(1)
            # except EmptyPage:
            #     samples_tests_paginated = paginator.page(paginator.num_pages)
            # Serialize the paginated data
            # serializer = SampleTestSerializer(
            #     samples_tests_paginated, many=True)
            serializer = SampleTestSerializer(sample_tests, many=True)

            # Return the paginated and serialized data
            return Response(
                {
                    "status": True,
                    "data": serializer.data,
                    # "pagination": {
                    #     "current_page": samples_tests_paginated.number,
                    #     "total_pages": paginator.num_pages,
                    #     "total_items": paginator.count,
                    # },
                },
                status=status.HTTP_200_OK,
            )

        except Exception as e:
            return Response(
                {"status": False, "error": str(e)},
                status=status.HTTP_500_INTERNAL_SERVER_ERROR,
            )


class FetchParticularSampleTestAPIView(APIView):
    authentication_classes = [CustomJWTAuthentication]
    permission_classes = [CanView]

    def get(self, request, test_id, *args, **kwargs):
        try:
            # Validate whether test_id is a valid UUID
            try:
                uuid_test_id = UUID(test_id)
            except ValueError:
                return Response(
                    {"status": False, "error": "Invalid UUID"},
                    status=status.HTTP_400_BAD_REQUEST,
                )

            # Fetch the SampleTest instance using the UUID
            try:
                sample_test = SampleTest.objects.get(id=uuid_test_id)
            except SampleTest.DoesNotExist:
                return Response(
                    {"status": False, "error": "SampleTest not found"},
                    status=status.HTTP_404_NOT_FOUND,
                )

            # Serialize the SampleTest instance if needed
            serializer = SampleTestSerializer(
                sample_test
            )  # Replace with your serializer
            serialized_data = serializer.data

            return Response(
                {"status": True, "data": serialized_data},
                status=status.HTTP_200_OK,
            )

        except Exception as e:
            return Response(
                {"status": False, "error": str(e)},
                status=status.HTTP_500_INTERNAL_SERVER_ERROR,
            )


class UploadFileAPIView(APIView):
    authentication_classes = [CustomJWTAuthentication]
    permission_classes = [IsStorageCenterStaff]

    def is_excel_file(self, file_name):
        # Add your logic to check if the file has an Excel extension
        valid_extensions = [".xls", ".xlsx"]
        return any(file_name.lower().endswith(ext) for ext in valid_extensions)

    def get(self, request):
        try:
            # Get all files
            files = UploadedFile.objects.all()
            # Apply filter if 'filter' query parameter is present
            filter_keywords = request.GET.get("filter")
            if filter_keywords:
                files = files.filter(file__icontains=filter_keywords)
            # Paginate the queryset
            paginator = Paginator(files, 10)  # Set the number of items per page as needed
            page_number = request.GET.get("page", 1)
            result_page = paginator.get_page(page_number)
            # Serialize the paginated queryset
            serializer = UploadedFileSerializer(result_page, many=True)

            return Response(
                {
                    "status": True,
                    "data": serializer.data,
                    "pagination": {
                        "current_page": result_page.number,
                        "total_pages": paginator.num_pages,
                        "total_items": paginator.count,
                    },
                },
                status=status.HTTP_200_OK,
            )
        except Exception as e:
            # Handle the exception and return an appropriate response
            return Response(
                {"status": False, "error": str(e)},
                status=status.HTTP_500_INTERNAL_SERVER_ERROR,
            )
        
    def post(self, request, *args, **kwargs):
        try:
            request.data["user"] = request.user.id

            # Check if the uploaded file is an Excel file
            uploaded_file = request.data.get("file")
            if not uploaded_file or not self.is_excel_file(uploaded_file.name):
                return Response(
                    {"status": False, "error": "Please upload a valid Excel file."},
                    status=status.HTTP_400_BAD_REQUEST,
                )

            serializer = UploadedFileSerializer(data=request.data)
            if serializer.is_valid():
                serializer.save()

                # open excel file in function and process it
                excel_sheets_data = process_excel_file(serializer.data["file"])
                for excel_sheet_data in excel_sheets_data:
                    # Process the data from the Excel sheet
                    sample_serializer = SampleSerializer(data=excel_sheet_data, many=True)
                    if sample_serializer.is_valid():
                        samples = sample_serializer.save()

                        # Iterate over the processed samples and create SampleStationLocator instances
                        sample_locator_data_list = []
                        for sample in samples:
                            sample_locator_data = {
                                "user": request.user.id,
                                "sample_id": sample.id,  # Assuming 'id' is the primary key of Sample model
                                "station_id": request.user.station_master.station.id,
                            }
                            sample_locator_data_list.append(sample_locator_data)

                        sample_locator_serializer = SampleStationLocatorSerializer(data=sample_locator_data_list, many=True)

                        if sample_locator_serializer.is_valid():
                            sample_locator_serializer.save()
                        else:
                            # Handle the case where the serializer is not valid
                            # Delete the created Sample instances
                            for sample in samples:
                                sample.delete()
                            # Delete the uploaded file instance
                            uploaded_file_instance = UploadedFile.objects.get(id=serializer.data["id"])
                            uploaded_file_instance.file.delete()
                            uploaded_file_instance.delete()
                            return Response(
                                {"status": False, "error": sample_locator_serializer.errors},
                                status=status.HTTP_400_BAD_REQUEST,
                            )

                    else:
                        # If there is an issue with the sample_serializer, delete the uploaded file and instance
                        uploaded_file_instance = UploadedFile.objects.get(id=serializer.data["id"])
                        uploaded_file_instance.file.delete()
                        uploaded_file_instance.delete()
                        return Response(
                            {"status": False, "error": sample_serializer.errors},
                            status=status.HTTP_400_BAD_REQUEST,
                        )

                return Response(
                    {
                        "status": True,
                        "message": "File Uploaded Successfully",
                        "data": {
                            "file": serializer.data,
                        },
                    },
                    status=status.HTTP_201_CREATED,
                )
        except Exception as e:
            # Handle other exceptions here
            return Response(
                {"status": False, "error": str(e)},
                status=status.HTTP_500_INTERNAL_SERVER_ERROR,
            )

        return Response(
            {"status": False, "error": "Unexpected error occurred."},
            status=status.HTTP_500_INTERNAL_SERVER_ERROR,
        )

    def delete(self, request, file_id):
        try:
            # Retrieve the UploadedFile object
            uploaded_file = UploadedFile.objects.get(id=file_id)

            # Delete the file
            uploaded_file.file.delete()
            uploaded_file.delete()

            return Response(
                {
                    "status": True,
                    "message": "File deleted successfully",
                    "deletedFileId": file_id,
                },
                status=status.HTTP_200_OK,
            )

        except UploadedFile.DoesNotExist:
            return Response(
                {"status": False, "error": "File not found"},
                status=status.HTTP_404_NOT_FOUND,
            )

        except Exception as e:
            return Response(
                {"status": False, "error": str(e)},
                status=status.HTTP_500_INTERNAL_SERVER_ERROR,
            )

    # except Exception as e:
    #     return Response(
    #         {"status": False, "error": str(e)},
    #         status=status.HTTP_500_INTERNAL_SERVER_ERROR,
    #     )


# from django.db import models
# class RemoveDuplicateSamplesView(APIView):
#     def get(self, request, format=None):
#         # Find samples with duplicate hash values
#         duplicate_hashes = Sample.objects.values('hash_value').annotate(count=models.Count('id')).filter(count__gt=1)

#         # Remove duplicates
#         for duplicate_hash in duplicate_hashes:
#             duplicate_samples = Sample.objects.filter(hash_value=duplicate_hash['hash_value']).order_by('-created_at')[1:]

#             for sample in duplicate_samples:
#                 sample.delete()

#         return Response({"detail": "Duplicate samples removed successfully."}, status=status.HTTP_200_OK)
