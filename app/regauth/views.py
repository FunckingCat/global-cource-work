from django.shortcuts import render

# Create your views here.
from django.shortcuts import render
from django.contrib.auth.forms import UserCreationForm


# Create your views here.

def sign_in(request):
    return render(request, 'auth/auth.html')


def sign_up(request):
    if request.method == 'POST':
        print('POST')
    form = UserCreationForm()
    return render(request, 'auth/reg.html', {
        "form": form
    })
