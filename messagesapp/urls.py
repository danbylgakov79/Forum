from django.urls import path
from messagesapp.views import *

urlpatterns = [
    path('<int:CategoryId>/<int:TopicId>/<int:ThemesId>/', messages_view),

]