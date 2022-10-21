FROM python:3.6-slim

# init system
RUN apt-get clean \
    && apt-get -y update

# install nginx
RUN apt-get -y install nginx \
    && apt-get -y install python3-dev \
    && apt-get -y install build-essential

# place nginx config
COPY nginx.conf /etc/nginx

# start nginx and uwsgi
COPY start.sh ./start.sh
RUN chmod +x ./start.sh
CMD ["./start.sh"]

