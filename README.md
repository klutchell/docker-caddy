# docker-caddy

[caddy](https://caddyserver.com/) docker images

## Build

```bash
# build for x86_64
make

# build for armhf
make armhf
```

## Deploy

```bash
# deploy on rpi3
docker run --name caddy \
    -v /path/to/caddyfile:/usr/src/app/Caddyfile
    -v caddy-data:/var/lib/caddy \
    -v caddy-certs:/root/.caddy \
    -p 80:80 -p 443:443 \
    -e TZ=America/Toronto \
    -e ACME_EMAIL=your@email.com \
    klutchell/caddy
```

## Environment

|Name|Description|Example|
|---|---|---|
|`CADDY_EMAIL`|email address to use for TLS certificate generation|`example@address.com`|
|`CADDY_ROOT`|path to the default site root from which to serve files|`/www`|
|`CADDY_FILE`|the caddyfile to use to configure caddy|`/www/Caddyfile`|
|`TZ`|container timezone|`America/Toronto`|

## Usage

add server definitions to `/www/Caddyfile` or mount your own Caddyfile

## Author

Kyle Harding <kylemharding@gmail.com>

## License

_tbd_

## Acknowledgments

* https://github.com/resin-io/resin-caddy
* https://github.com/abiosoft/caddy-docker

