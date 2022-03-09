from django.contrib import admin
from django.urls import path
from topicapp.views import *

urlpatterns = [
    path('<int:CategoryId>/', category_detail_view),
    path('createtopic/<int:CategoryId>/', create_topic),
    path('<int:CategoryId>/deletetopic/<int:id>/', topic_delete),
    path('<int:CategoryId>/updatetopic/<int:id>/', topik_update)
]
