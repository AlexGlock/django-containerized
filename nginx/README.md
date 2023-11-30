<img src="nginx.png" width="600" height="170">

## The server setup

This folder contains the configs and image setup to deploy the ``django_podman`` webapp.
webservice on a local linux server machine with hostname ``example.org``.

# How it works

Its really straight forward with nginx. As you can see the whole configuration is done
inside one file named ``default.conf``. Depending wheather you want to configure your server
for HTTP or HTTPS the file might change a little. This project uses a HTTPS setup via port 443
and matching SSL certiicates. A HTTP config would look similar to this:

    server {

        listen          80;
        server_name     example.org;
        charset         utf-8;

        location /static {
            alias /usr/src/app/static;
        }

        location /media {
            alias /usr/src/app/media;
        }

        location /favicon.ico {
            alias /usr/src/app/static/favicon.ico;
        }

        location / {
            proxy_pass http://web:8000;
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        }

    }
