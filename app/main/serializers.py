from rest_framework import serializers
from rest_framework.serializers import ValidationError

from main.models import Coupon


class CouponSerializer(serializers.ModelSerializer):

    def validate(self, attrs):
        if attrs['price'] < 1 or attrs['old_price'] < 1:
            raise ValidationError(['price and old_price should be greater or equal 1'])
        return attrs
    # Apply custom validation either here, or in the view.

    class Meta:
        model = Coupon
        fields = "__all__"
