from django.forms import ModelForm
from .models import TopicModel

class TopicForm(ModelForm):
    class Meta:
        model = TopicModel
        fields = ('Category','Name','Content')