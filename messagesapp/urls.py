from django.urls import path
from messagesapp.views import *

urlpatterns = [
    path('<int:CategoryId>/<int:TopicId>/<int:ThemesId>/', messages_view),
    path('<int:CategoryId>/<int:TopicId>/<int:ThemesId>/createmessage/', message_create),
    path('<int:CategoryId>/<int:TopicId>/<int:ThemesId>/deletemessage/<int:id>/', message_delete),
    path('<int:CategoryId>/<int:TopicId>/<int:ThemesId>/updatemessage/<int:id>/', message_update)
]