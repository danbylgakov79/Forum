from django.contrib import auth
from django.forms import forms
from django.forms import CharField
from django.contrib.auth.models import User
from django.forms import ModelForm
from django import forms



class UserRegistrationForm(ModelForm):
    class Meta:
        model = User
        fields = ('username', 'first_name', 'email','password')

    def clean_password2(self):
        cd = self.cleaned_data
        if cd['password'] != cd['password2']:
            raise forms.ValidationError('Passwords don\'t match.')
        return cd['password2']