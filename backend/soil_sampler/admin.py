from django.contrib import admin
from .models import User, StationMaster, SampleStationLocator, Sample, Captcha, Station, SampleTest,UploadedFile
# Register your models here.


class UserAdmin(admin.ModelAdmin):
    search_fields = ['name', 'email']
    list_display = ('name', 'email')


class SampleAdmin(admin.ModelAdmin):
    search_fields = ['id', 'sample_no',
                     'location', 'top_depth','hash_value']
    list_display = ('id', 'sample_no',
                    'location', 'top_depth', 'is_archived','hash_value')


class SampleStationLocatorAdmin(admin.ModelAdmin):
    search_fields = ['id', 'sample_id__id',
                     'sample_id__sample_no', "station_id__id"]
    list_display = ('id', 'sample_id', 'station_id', 'user',
                    'is_completed', 'is_dispatched', 'created_at')


class SampleTestAdmin(admin.ModelAdmin):
    search_fields = ['id', 'sample_station_locator_id__id', 'sample_station_locator_id__sample_id__id',
                     'sample_station_locator_id__sample_id__sample_no', "sample_station_locator_id__station_id__id"]
    list_display = ('id', 'sample_station_locator_id',
                    'is_completed', 'created_at')


admin.site.register(User, UserAdmin)
admin.site.register(StationMaster)
admin.site.register(Sample, SampleAdmin)
admin.site.register(SampleStationLocator, SampleStationLocatorAdmin)
admin.site.register(Captcha)
admin.site.register(Station)
admin.site.register(UploadedFile)
admin.site.register(SampleTest, SampleTestAdmin)
