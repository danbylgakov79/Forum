from typing import Tuple

from django.forms import ModelForm
from django import forms
from .models import ThemesModel


class ThemesForm(ModelForm):

    class Meta:
        model = ThemesModel
        fields = ('Name','Content')