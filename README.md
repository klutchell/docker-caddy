# resin-caddy

[caddy](https://caddyserver.com/) service for [resin.io](https://resin.io/) stacks

## Build

```bash
make build
docker login
make push
```

## Deploy

```bash
docker run --name caddy \
-v caddy-data:/var/lib/caddy \
-v caddy-certs:/root/.caddy \
-p 80:80 -p 443:443 \
klutchell/resin-caddy:latest
```

## Usage

use the [resin web terminal](https://docs.resin.io/learn/manage/ssh-access/#using-the-dashboard-web-terminal)
to create `/var/lib/caddy/Caddyfile` with your server definitions

## Author

Kyle Harding <kylemharding@gmail.com>

## License

_tbd_

## Acknowledgments

* https://github.com/resin-io/resin-caddy
* https://github.com/abiosoft/caddy-docker

