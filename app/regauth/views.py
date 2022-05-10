from django.shortcuts import render, redirect

# Create your views here.
from django.shortcuts import render
from .forms import UserRegForm, UserLoginForm
from django.contrib import messages
from django.contrib.auth import login, logout


# Create your views here.

def sign_in(request):
    if request.method == 'POST':
        form = UserLoginForm(data=request.POST)
        if form.is_valid():
            user = form.get_user()
            login(request, user)
            return redirect('/')
        else:
            messages.error(request, 'Ошибка входа')
    else:
        form = UserLoginForm()
    return render(request, 'auth/auth.html', {
        'title': 'Вход',
        'form': form,
    })


def sign_up(request):
    if request.method == 'POST':
        form = UserRegForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, 'Вы успешно зарегистрированы')
            return redirect('sign-in')
        else:
            messages.error(request, 'Ошибка регистрации')
    else:
        form = UserRegForm()
    return render(request, 'auth/reg.html', {
        "form": form
    })
