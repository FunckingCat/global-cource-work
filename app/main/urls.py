from django.urls import path, include
from . import views

urlpatterns = [
    path('', views.index, name='main-page'),
    path('<int:category_id>/', views.index, name='category'),
    path('coupon/<int:coupon_id>/', views.coupon, name='coupon'),
    path('search/', views.search, name='search'),
    path('cart/', views.cart, name='cart'),
    path('add/<int:coupon_id>/', views.add, name='cart-add'),
    path('delete/<int:coupon_id>/', views.delete, name='cart-del'),
]
