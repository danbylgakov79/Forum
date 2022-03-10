
from django.forms import ModelForm
from django import forms
from .models import MessagesModel

class MessagesForm(ModelForm):

    class Meta:
        model = MessagesModel
        fields = ('Author','Text')