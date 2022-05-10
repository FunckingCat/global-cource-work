from django.shortcuts import render


# Create your views here.

def index(request):
    return render(request, 'cart/cart.html')


def add(request, coupon_id=0):
    return render(request, 'cart/cart.html')


def delete(request, coupon_id=0):
    return render(request, 'cart/cart.html')
