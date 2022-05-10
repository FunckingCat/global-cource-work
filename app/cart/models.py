from django.db import models
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver

from app.main.models import Coupon


class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    cart = models.ManyToManyField(Coupon)
    bought = models.ManyToManyField(Coupon)


@receiver(post_save, sender=User)
def create_user_profile(sender, instance, created, **kwargs):
    if created:
        Profile.objects.create(user=instance)


@receiver(post_save, sender=User)
def save_user_profile(sender, instance, **kwargs):
    instance.profile.save()
