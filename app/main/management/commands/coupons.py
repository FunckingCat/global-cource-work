from main.models import Coupon
from django.core.management.base import BaseCommand


class Command(BaseCommand):
    help = 'Отображает текущее время'

    def handle(self, *args, **kwargs):
        for coupon in Coupon.objects.all():
            print('{}\t\t{}'.format(coupon.price, coupon.name))