from typing import Union, Any

from django.shortcuts import render
from .models import Category, Coupon


# Create your views here.

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

    return render(request, 'main/main.html', {
        'request': request,
        'title': title,
        'title_badge': 'Купонов категории: ' + str(coupons.count()),
        'navmenu': main_tabs,
        'subs': subs,
        'coupons': coupons
    })


def coupon(request, coupon_id=0):
    main_tabs = Category.objects.filter(parent_category=None).order_by('id')
    coupons = Coupon.objects.filter(id=coupon_id).first()
    return render(request, 'main/product.html', {
        'title': "title",
        'navmenu': main_tabs,
        'coupon': coupons,
        'sub' : coupons.old_price - coupons.price,
    })
