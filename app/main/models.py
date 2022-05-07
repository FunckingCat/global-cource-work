from django.db import models


# Create your models here.

class Category(models.Model):
    name = models.CharField(max_length=40, verbose_name='Название')
    parent_category = models.ForeignKey('self', on_delete=models.CASCADE, null=True, blank=True)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name_plural = 'Категории'
        verbose_name = 'Категория'
        ordering = ['name']


class Coupon(models.Model):
    name = models.CharField(max_length=150, verbose_name='Название')
    condition = models.TextField(verbose_name='Условия')
    description = models.TextField(verbose_name='Описание')
    address = models.TextField(verbose_name='Адреса')
    old_price = models.DecimalField(max_digits=10, decimal_places=2, blank=True, default=0, verbose_name='Старая цена')
    price = models.DecimalField(max_digits=10, decimal_places=2, default=0, verbose_name='Новая цена')
    created_at = models.DateTimeField(auto_now_add=True, verbose_name='Создан')
    photo = models.ImageField(upload_to='photos', verbose_name='Фото')
    category = models.ForeignKey(Category, on_delete=models.PROTECT)

    class Meta:
        verbose_name = "Купон"
        verbose_name_plural = "Купоны"

    def __str__(self):
        return self.name
