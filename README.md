# UWSGI Demo


Start in prod to see flask message
```shell
$ export FLASK_ENV=production
$ FLASK_APP=hello.py flask run --port 5555
```

Start uWSGI using the ini file
```shell
$ uwsgi --ini uwsgi.ini
```

Spawns 1 master process and 5 workers, e.g. `htop --filter wsgi`
```shell
9190 jody ... uwsgi --ini uwsgi.ini
```

Creates one unix domain socket file as defined
```shell
$ ls -l /tmp/uwsgi.socket
srwxr-xr-x jody jody 0 B Wed Oct 19 22:36:28 2022 /tmp/uwsgi.socket
```
