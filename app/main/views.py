from typing import Union, Any

from django.shortcuts import render, redirect
from django.urls import reverse
from django.db.models import Q
from django.contrib import messages

from .models import Category, Coupon


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
        'title': "title",
        'chumps': chumps,
        'navmenu': main_tabs,
        'coupon': coupons,
        'sub': coupons.old_price - coupons.price,
    })


def cart(request):
    return render(request, 'main/cart.html')


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
    return render(request, 'main/cart.html')
