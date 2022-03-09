from django.urls import path
from themesapp.views import *


urlpatterns = [
    path('<int:CategoryId>/<int:Topicid>/', themes_view),
    path('<int:CategoryId>/<int:Topicid>/createtheme/', create_theme),
    path('<int:CategoryId>/<int:Topicid>/deletetheme/<int:id>/', theme_delete),
    path('<int:CategoryId>/<int:Topicid>/updatetheme/<int:id>/', theme_update)
]