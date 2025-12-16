# urls.py
from django.urls import path

from .views import (
    FetchSampleAPIView,
    GetLoggedInUserDataView,
    LocateSampleAPIView,
    # RemoveDuplicateSamplesView,
    SampleStationLocatorAPIView,
    SampleTestAPIView,
    UploadFileAPIView,
    UserRegistrationAPIView,
    UserLoginViewAPIView,
    CaptchaAPIView,
    UserLogoutViewAPIView,
    SampleAPIView,
    StationAPIView,
    ScanSampleAPIView,
    GetSampleAPIView,
    FetchParticularSampleTestAPIView,DispatchSampleAPIView,
)

urlpatterns = [
    # Generate Captcha
    path("captcha/", CaptchaAPIView.as_view(), name="register_user"),
    # Register User
    path("register/", UserRegistrationAPIView.as_view(), name="register_user"),
    # Login User
    path("login/", UserLoginViewAPIView.as_view(), name="login_user"),
    # Logout User
    path("logout/", UserLogoutViewAPIView.as_view(), name="logout_user"),
    # Get logged in user data
    path("user/", GetLoggedInUserDataView.as_view(), name="get_logged_in_user"),
    # Generate Sample
    path("sample/generate/", SampleAPIView.as_view(), name="generate_sample"),
    # Get Sample Details
    path("sample/get/<str:sample_id>/", GetSampleAPIView.as_view(), name="get_sample"),
    # Scan a sample at station
    path("sample/scan/", ScanSampleAPIView.as_view(), name="scan_sample"),
    # Dispatch a sample at station
    path("sample/dispatch/", DispatchSampleAPIView.as_view(), name="dispatch_sample"),
    # Scan a sample at station of that particular station staff
    path("sample/search/station-staff/", SampleStationLocatorAPIView.as_view(), name="search_samples_for_station_staff"),
    # Scan a sample at station
    path("sample/search/", FetchSampleAPIView.as_view(), name="scan_sample"),
    # Locate a sample
    path(
        "sample/locate/<str:id>/",
        LocateSampleAPIView.as_view(),
        name="locate_sample",
    ),
    # Sample Test
    path("sample/test/", SampleTestAPIView.as_view(), name="test_sample"),
    path("sample/test/<str:test_id>/", FetchParticularSampleTestAPIView.as_view(), name="search_particular_sample_test"),
    # Generate and Fetch Station Details
    path("station/", StationAPIView.as_view(), name="station_details"),
        # path('remove_duplicates/', RemoveDuplicateSamplesView.as_view(), name='remove_duplicates'),
    path("upload/", UploadFileAPIView.as_view(), name="upload_file"),
    path("upload/<str:file_id>/", UploadFileAPIView.as_view(), name="delete__uploaded_file"),


]
