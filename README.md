# resin-caddy

[caddy](https://caddyserver.com/) service for [resin.io](https://resin.io/) stacks

## Getting Started

* https://docs.resin.io/learn/getting-started
* https://caddyserver.com/tutorial/caddyfile

## Deployment

```bash
docker run --name caddy \
-v caddy-data:/var/lib/caddy \
-v caddy-certs:/root/.caddy \
-p 80:80 -p 443:443 \
klutchell/resin-caddy
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

