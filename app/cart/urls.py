from django.urls import path, include
from . import views

urlpatterns = [
    path('', views.index, name='cart'),
    path('add/<int:category_id>/', views.add, name='card-add'),
    path('delete/<int:category_id>/', views.delete, name='card-add'),
]