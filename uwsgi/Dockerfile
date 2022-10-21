FROM python:3.6-slim

ARG UWSGI_HOST
ARG UWSGI_PORT

# init system
RUN apt-get clean \
    && apt-get -y update

RUN apt-get -y install build-essential

# copy src
COPY . /srv/flask_app
WORKDIR /srv/flask_app

# install deps
RUN pip install -r requirements.txt --src /usr/local/src