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
|`ACME_EMAIL`|email address to agree to LetsEncrypt TOS|`your@email.com`|
|`TZ`|(optional) container timezone|`America/Toronto`|

## Usage

add server definitions to `/var/lib/caddy/Caddyfile` or mount your own Caddyfile

## Author

Kyle Harding <kylemharding@gmail.com>

## License

_tbd_

## Acknowledgments

* https://github.com/resin-io/resin-caddy
* https://github.com/abiosoft/caddy-docker

