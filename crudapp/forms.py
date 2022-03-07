from .models import CategoryModel,TopicModel
from django.forms import ModelForm
class CategoryForm(ModelForm):
    class Meta:
        model = CategoryModel
        fields = ('ID','Name','Content')

class TopicForm(ModelForm):
    class Meta:
        model = TopicModel
        fields = ('ID','Category','Name','Content')