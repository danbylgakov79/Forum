from .models import CategoryModel
from django.forms import ModelForm
class CategoryForm(ModelForm):
    class Meta:
        model = CategoryModel
        fields = ('ID','Name','Content')