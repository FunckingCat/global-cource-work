from django.contrib import admin
from . import models
from import_export.admin import ExportActionMixin
from simple_history.admin import SimpleHistoryAdmin

# Register your models here.

admin.site.register(models.Category)


class CouponHistoryAdmin(SimpleHistoryAdmin, ExportActionMixin, admin.ModelAdmin):
    list_display = [field.name for field in models.Coupon._meta.get_fields()]
    history_list_display = [field.name for field in models.Coupon._meta.get_fields()]
    search_fields = [field.name for field in models.Coupon._meta.get_fields()]


# class CouponAdmin(ExportActionMixin, admin.ModelAdmin):
#     pass


admin.site.register(models.Coupon, CouponHistoryAdmin)

# admin.site.register(models.Coupon, CouponAdmin)

admin.site.register(models.Profile)
