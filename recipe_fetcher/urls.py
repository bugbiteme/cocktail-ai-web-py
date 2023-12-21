from django.urls import path
from . import views

urlpatterns = [
    path('', views.fetch_recipe, name='fetch_recipe'),
]