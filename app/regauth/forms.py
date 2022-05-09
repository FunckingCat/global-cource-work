from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User


class UserRegForm(UserCreationForm):
    username = forms.CharField(max_length=150, label='Имя пользователя', widget=forms.TextInput(attrs={'class': 'form-control form-control-lg'}))
    email = forms.EmailField(label='Почта', widget=forms.EmailInput(attrs={'class': 'form-control form-control-lg'}))
    password1 = forms.CharField(max_length=150, label='Пароль', widget=forms.PasswordInput(attrs={'class': 'form-control form-control-lg'}))
    password2 = forms.CharField(max_length=150, label='Повторите пароль', widget=forms.PasswordInput(attrs={'class': 'form-control form-control-lg'}))

    class Meta:
        model = User
        fields = ('username', 'email', 'password1', 'password2')
