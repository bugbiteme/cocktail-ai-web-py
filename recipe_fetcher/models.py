from django.db import models
from django.urls import path
from recipe_fetcher.views import fetch_recipe

urlpatterns = [
    path('fetch_recipe/', fetch_recipe, name='fetch_recipe'),
    # ... other url patterns ...
]