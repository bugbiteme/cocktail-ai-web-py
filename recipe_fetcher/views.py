import requests
import os
import logging
from django.shortcuts import render, redirect
from django.conf import settings
from django.views.decorators.csrf import csrf_exempt

logging.basicConfig(level=logging.INFO, format='[%(levelname)s][%(asctime)s] - %(message)s')

def fetch_recipe(request):
    recipe_data = None
    error = None

    if request.method == 'POST':
        prompt = request.POST.get('prompt', '')
        api_url = os.getenv("API_URL")
        json_payload = {"prompt": prompt}

        logging.info(api_url) 
        logging.info(json_payload)

        try:
            response = requests.post(api_url, json=json_payload)
            if response.status_code == 200:
                recipe_data = response.json()
            else:
                error = "Error fetching recipe."
                logging.info(error)
        except requests.RequestException as e:
            error = str(e)
    return render(request, 'recipe_fetcher.html', {
        'recipe_data': recipe_data,
        'error': error
    })
