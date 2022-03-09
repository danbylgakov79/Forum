from django.urls import path
from themesapp.views import *


urlpatterns = [
    path('<int:TopicId>/<int:id>/', themes_view),
    path('<int:TopicId>/createtheme/', create_theme),
    path('<int:TopicId>/deletetheme/<int:id>/', theme_delete),
    path('<int:TopicId>/updatetheme/<int:id>', theme_update)
]