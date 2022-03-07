from .models import CategoryModel,TopicModel
from django.forms import ModelForm
class CategoryForm(ModelForm):
    class Meta:
        model = CategoryModel
        fields = ('Name','Content')

class TopicForm(ModelForm):
    class Meta:
        model = TopicModel
        fields = ('Category','Name','Content')