from django.contrib import admin
from django.urls import path
from .views import sign_in, sign_up, user_logout

urlpatterns = [
    path('signin/', sign_in, name='sign-in'),
    path('signup/', sign_up, name='sign-up'),
    path('logout/', user_logout, name='logout'),
]
