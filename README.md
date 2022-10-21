# UWSGI Test

A test production configuration for uWSGI.

## Overview

1. uwsgi container running flask hello world app ([docs](https://uwsgi-docs.readthedocs.io/en/latest/WSGIquickstart.html#deploying-flask))
    ```shell
    uwsgi --socket ${UWSGI_HOST}:${UWSGI_PORT} --wsgi-file hello.py --callable app --processes 4 --threads 2
    ```
2. nginx container running as reverse proxy to uwsgi over ip:port ([docs](https://nginx.org/en/docs/http/ngx_http_uwsgi_module.html#uwsgi_pass))

    ```text
    location / {
        include uwsgi_params;
        # connect to {uwsgi_protocol}://{container internal ip}:{exposed port}
        uwsgi_pass uwsgi://uwsgi:9000;
        uwsgi_read_timeout 1h;
        uwsgi_send_timeout 1h;
        proxy_send_timeout 1h;
        proxy_read_timeout 1h;
    }
    ```
## Usage

```shell
# fire it up
docker compose up
# or force rebuild
docker compose up --build --force-recreate --no-deps
```