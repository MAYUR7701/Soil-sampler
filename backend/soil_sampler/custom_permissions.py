from rest_framework import permissions
from rest_framework.exceptions import PermissionDenied

class IsStationStaff(permissions.BasePermission):
    """
    Custom permission to check whether the user is a station staff member.
    """

    def has_permission(self, request, view):
        # Check if the user is a station staff member
        if not (hasattr(request.user, 'station_master') and request.user.station_master is not None):
            raise PermissionDenied("User is not a station master")
        return True

class IsStorageCenterStaff(permissions.BasePermission):
    """
    Custom permission to check whether the user is a station staff member.
    """

    def has_permission(self, request, view):
        # Check if the user is a station staff member
        if not (hasattr(request.user, 'station_master') and request.user.station_master is not None and request.user.station_master.station.is_storage_center is True):
            raise PermissionDenied("User is not a storage center staff member")
        return True

class CanView(permissions.BasePermission):
    """
    Custom permission to check whether the user is a station staff member.
    """

    def has_permission(self, request, view):
        # Check if the user is a station master or admin or has permission to view 
        if not ((hasattr(request.user, 'station_master') and request.user.station_master is not None) or request.user.is_staff or (hasattr(request.user, 'can_view') and request.user.can_view is True)):
            raise PermissionDenied("User is not allowed to view")
        return True