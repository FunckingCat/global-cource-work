from main.models import Category
from django.core.management.base import BaseCommand


class Command(BaseCommand):
    help = 'Отображает текущее время'

    def handle(self, *args, **kwargs):
        for cat in Category.objects.all():
            print('{} находится в {}'.format(cat, cat.parent_category))