# docker-caddy

[caddy](https://caddyserver.com/) docker images

## Build

```bash
# build for rpi3
make build-rpi3
```

## Deploy

```bash
# deploy on rpi3
docker run --name caddy \
-v caddy-data:/var/lib/caddy \
-v caddy-certs:/root/.caddy \
-p 80:80 -p 443:443 \
klutchell/caddy:rpi3-latest
```

## Parameters

* `-v caddy-data:/var/lib/caddy` - persistent data volume
* `-v caddy-certs:/root/.caddy` - persistent certificates volume
* `-p 80:80 -p 443:443` - ports to expose

## Usage

* add server definitions to `/var/lib/caddy/Caddyfile`

## Author

Kyle Harding <kylemharding@gmail.com>

## License

_tbd_

## Acknowledgments

* https://github.com/resin-io/resin-caddy
* https://github.com/abiosoft/caddy-docker

