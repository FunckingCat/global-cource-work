from typing import Union, Any

import re

from django.shortcuts import render, redirect
from django.urls import reverse
from django.db.models import Q
from django.contrib import messages
from rest_framework import status, viewsets
from rest_framework.response import Response
from rest_framework.decorators import action
from rest_framework import filters
import django_filters.rest_framework
from django_filters.rest_framework import DjangoFilterBackend

from .models import Category, Coupon
from .serializers import CouponSerializer


# Create your views here.

def genBreadChumps(category):
    res = []
    while category is not None:
        res.append([category.name, reverse('category', args=[category.id])])
        category = category.parent_category
    return list(reversed(res))


def getCoupons(category):
    coupons = Coupon.objects.filter(category=category)
    for item in Category.objects.filter(parent_category=category):
        coupons = coupons | getCoupons(item)
    return coupons


def index(request, category_id=0):
    main_tabs = Category.objects.filter(parent_category=None).order_by('id')
    category = Category.objects.filter(id=category_id).first()
    subs = Category.objects.filter(parent_category=category)
    if category is None:
        title = "Все купоны"
        coupons = Coupon.objects.all()
    else:
        title = category.name
        coupons = getCoupons(category)

    chumps = genBreadChumps(category)

    return render(request, 'main/main.html', {
        'request': request,
        'chumps': chumps,
        'title': title,
        'title_badge': 'Купонов категории: ' + str(coupons.count()),
        'navmenu': main_tabs,
        'subs': subs,
        'coupons': coupons
    })


def search(request, search_string=''):
    main_tabs = Category.objects.filter(parent_category=None).order_by('id')
    subs = []
    title = "Поиск купонов"
    chumps = []
    search_string = request.GET.get('search_string', '')
    coupons = Coupon.objects.filter(
        Q(name__icontains=search_string) |
        Q(address__icontains=search_string) |
        Q(condition__icontains=search_string) |
        Q(description__icontains=search_string)
    )

    return render(request, 'main/main.html', {
        'request': request,
        'chumps': chumps,
        'title': title,
        'title_badge': 'Найдено купонов: ' + str(coupons.count()),
        'navmenu': main_tabs,
        'subs': subs,
        'coupons': coupons
    })


def coupon(request, coupon_id=0):
    main_tabs = Category.objects.filter(parent_category=None).order_by('id')
    coupons = Coupon.objects.filter(id=coupon_id).first()
    if coupons is not None:
        chumps = genBreadChumps(coupons.category)
        chumps.append([coupons.name, reverse('coupon', args=[coupons.id])])
    else:
        chumps = []
    return render(request, 'main/product.html', {
        'title': coupons.name,
        'chumps': chumps,
        'navmenu': main_tabs,
        'coupon': coupons,
        'sub': coupons.old_price - coupons.price,
    })


def cart(request):
    if not request.user.is_authenticated:
        return render(request, 'main/error_page.html', {
            'error_code': '500',
            'error_text': 'Упс... Перед тем как зайти в корзину надо Войти'
        })
    main_tabs = Category.objects.filter(parent_category=None).order_by('id')
    total_cost = 0
    for coupon_in_cart in request.user.profile.cart.all():
        total_cost += coupon_in_cart.price
    return render(request, 'main/cart.html', {
        'title': 'Корзина',
        'chumps': [],
        'navmenu': main_tabs,
        'count_coupons': request.user.profile.cart.all().count(),
        'coupons': request.user.profile.cart.all(),
        'total_cost': total_cost,
    })


def add(request, coupon_id=0):
    if not request.user.is_authenticated:
        return render(request, 'main/error_page.html', {
            'error_code': '500',
            'error_text': 'Упс... Перед тем как что то купить надо Войти'
        })
    coupon = Coupon.objects.filter(id=coupon_id).first()
    if coupon is None:
        return render(request, 'main/error_page.html', {
            'error_code': '505',
            'error_text': 'Купон не найден'
        })
    request.user.profile.cart.add(coupon)
    messages.success(request, 'Купон добавлен в корзину')
    return redirect('/')


def delete(request, coupon_id=0):
    if not request.user.is_authenticated:
        return render(request, 'main/error_page.html', {
            'error_code': '500',
            'error_text': 'Упс... Перед тем как что то удалить надо Войти'
        })
    coupon = Coupon.objects.filter(id=coupon_id).first()
    if coupon is None:
        return render(request, 'main/error_page.html', {
            'error_code': '505',
            'error_text': 'Купон не найден'
        })
    request.user.profile.cart.remove(coupon)
    return redirect(reverse('cart'))


def buy(request):
    if not request.user.is_authenticated:
        return render(request, 'main/error_page.html', {
            'error_code': '500',
            'error_text': 'Упс... Перед тем как что то удалить надо Войти'
        })
    coupons = request.user.profile.cart.all()
    if coupons.count() < 1:
        return render(request, 'main/error_page.html', {
            'error_code': '200',
            'error_text': 'Ой... Похоже в корзине нет записей'
        })
    for coupon_item in coupons:
        request.user.profile.cart.remove(coupon_item)
        request.user.profile.bought.add(coupon_item)
    return render(request, 'main/error_page.html', {
        'error_code': '200',
        'error_text': 'Купоны успешно куплены. (Здесь должна была быть интеграция с платежной системой)'
    })


class CouponViewSet(viewsets.ModelViewSet):
    queryset = Coupon.objects.all()
    serializer_class = CouponSerializer
    # filter_backends = [filters.SearchFilter, django_filters.rest_framework.DjangoFilterBackend]
    filter_backends = [filters.SearchFilter, DjangoFilterBackend]
    search_fields = ['name', 'condition', 'description', 'address', 'price', 'old_price']
    filterset_fields = ['name', 'condition', 'description', 'address', 'price', 'old_price']

    def get_queryset(self):
        queryset = Coupon.objects.all()
        param = self.request.query_params.get('maxPrice')
        if param is not None:
            queryset = queryset.filter(price__lte=param)
        return queryset

    @action(methods=['get'], detail=False)
    def category(self, request):
        cats = Category.objects.all().values()
        return Response({'categories': [i['name'] for i in cats]})

    @action(methods=['post'], detail=True)
    def update_price(self, request, pk=None):
        new_price = int(re.sub(r'[^0-9]', '', request.data['price']))
        if new_price < 0:
            return Response('Bad price', status=status.HTTP_500_INTERNAL_SERVER_ERROR)
        cp = Coupon.objects.filter(id=pk)
        cp.update(price=new_price)
        return Response({'coupon': cp.values()[0]})
