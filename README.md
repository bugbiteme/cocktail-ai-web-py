# cocktail-ai-web-py

Web front-end for cocktail-ai (or mocktail-ai)
https://github.com/bugbiteme/cocktail-ai
https://github.com/bugbiteme/mocktail-ai

```
podman build -t cocktail-ai-web .
podman run -e API_URL=$API_URL -p 8000:8080 cocktail-ai-web
```

This command runs the podman container, mapping port 8000 on your local machine to port 8080 in the podman container (which your FastAPI app should be listening on).  
  
## To test locally

If you're not already doing so, consider using a virtual environment. This isolates your project's dependencies from the global Python environment and can often resolve conflicts and dependency issues.  
  
```
python -m venv venv
source venv/bin/activate  # For Unix or MacOS
venv\Scripts\activate     # For Windows

pip install --upgrade pip
pip install -r requirements.txt

export API_URL=<url of your coctail-ai-api route>/generate-recipe/

python manage.py migrate

python manage.py runserver
```

## To clean up python virtual environment
- If you are currently inside a virtual environment, you'll need to deactivate it first. You can do this by running the deactivate command in your terminal or command prompt.  

```
deactivate
```

This will return you to your system's default Python environment.  
  
Once you've deactivated the virtual environment, you can simply delete its directory to remove it completely. The virtual environment is just a directory containing all the necessary files, so removing this directory will delete the environment.

```
rm -rf venv  # Unix/Linux/MacOS
rmdir /s /q venv  # Windows
```