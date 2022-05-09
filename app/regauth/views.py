from django.shortcuts import render, redirect

# Create your views here.
from django.shortcuts import render
from .forms import UserRegForm
from django.contrib import messages


# Create your views here.

def sign_in(request):
    return render(request, 'auth/auth.html')


def sign_up(request):
    if request.method == 'POST':
        form = UserRegForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, 'Вы успешно зарегистрированы')
            return redirect('/')
        else:
            messages.error(request, 'Ошибка регистрации')
    else:
        form = UserRegForm()
    return render(request, 'auth/reg.html', {
        "form": form
    })
