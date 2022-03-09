from django.contrib import admin
from django.urls import path

from topicapp.views import *


urlpatterns = [
    path('admin/', admin.site.urls),
    path('<int:Categoryid>/', category_detail_view),
    path('createtopic/<int:Categoryid>/', create_topic),
    path('<int:Categoryid>/deletetopic/<int:id>/', topic_delete),
    path('<int:Categoryid>/updatetopic/<int:id>/', topik_update)
]
