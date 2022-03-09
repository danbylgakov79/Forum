from django.urls import path
from themesapp.views import *

urlpatterns = [
    path('<int:CategoryId>/<int:TopicId>/', themes_view),
    path('<int:CategoryId>/<int:TopicId>/createtheme/', create_theme),
    path('<int:CategoryId>/<int:TopicId>/deletetheme/<int:id>/', theme_delete),
    path('<int:CategoryId>/<int:TopicId>/updatetheme/<int:id>/', theme_update)
]