FROM python:3.6-slim

# init system
RUN apt-get clean \
    && apt-get -y update

# copy src
COPY . /srv/flask_app
WORKDIR /srv/flask_app

# install nginx
RUN apt-get -y install nginx \
    && apt-get -y install python3-dev \
    && apt-get -y install build-essential

# install deps
RUN pip install -r requirements.txt --src /usr/local/src

# place nginx config
COPY nginx.conf /etc/nginx

# start nginx and uwsgi
RUN chmod +x ./start.sh
CMD ["./start.sh"]

