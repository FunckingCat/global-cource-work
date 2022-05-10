from django.urls import path, include
from . import views

urlpatterns = [
    path('', views.index, name='main-page'),
    path('<int:category_id>/', views.index, name='category'),
    path('coupon/<int:coupon_id>/', views.coupon, name='coupon'),
    path('search/', views.search, name='search'),
]
