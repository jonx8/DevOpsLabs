FROM alpine:3.19.1

# Install python
RUN apk add --no-cache --update python3~3.11 py3-pip

WORKDIR /app

# Install requirements dependencies
COPY ./django-search/requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt --no-cache --break-system-packages

COPY ./django-search /app/
RUN chown 1001:0 /app

EXPOSE 8000

USER 1001

CMD ["sh", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]
    

