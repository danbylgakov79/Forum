from django.urls import path
from messagesapp.views import *

urlpatterns = [
    path('<int:CategoryId>/<int:TopicId>/<int:ThemesId>/', messages_view),
    path('<int:CategoryId>/<int:TopicId>/<int:ThemesId>/createmessage/', create_message),
]