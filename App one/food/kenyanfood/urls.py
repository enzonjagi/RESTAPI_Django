from django.urls import path
from .views import getFood, postFood
from django.conf import settings

urlpatterns = [
    path('', getFood),
    path('post/', postFood),
]