# Use an official Python runtime as a parent image
FROM python:3.12-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container
WORKDIR /app

# Install the necessary packages to compile uWSGI
RUN apt-get update \
    && apt-get install -y gcc libpcre3 libpcre3-dev

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Define environment variable
ENV NAME World

# Run the command to start uWSGI
CMD ["uwsgi", "--http", ":8080", "--module", "myproject.wsgi"]