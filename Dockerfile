FROM registry.access.redhat.com/ubi9/ubi-minimal:latest

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app

COPY . /app

RUN microdnf update -y && \ 
    microdnf install python39 python3-devel gcc -y && \
    python3.9 -m ensurepip && \
    python3.9 -m pip install --upgrade pip

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8080

CMD ["uwsgi", "--http", ":8080", "--module", "myproject.wsgi"]