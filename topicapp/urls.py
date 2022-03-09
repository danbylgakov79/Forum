from django.contrib import admin
from django.urls import path

from topicapp.views import *


urlpatterns = [
    path('admin/', admin.site.urls),
    path('<int:id>/', category_detail_view),
    path('createtopic/', create_topic),
    path('deletetopic/<int:id>/', topic_delete),
    path('updatetopic/<int:id>/', topik_update)
]
