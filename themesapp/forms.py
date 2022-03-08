from django.forms import ModelForm
from .models import ThemesModel


class ThemesForm(ModelForm):
    class Meta:
        model = ThemesModel
        fields = ('Category','Topic','Name','Content')