FROM resin/raspberrypi3-alpine:3.6

LABEL maintainer="kylemharding@gmail.com"

# allow building on x86
RUN [ "cross-build-start" ]

# default plugins
ARG PLUGINS="http.reauth,tls.dns.cloudflare"

# install curl
RUN apk add --no-cache curl

# install caddy
RUN curl https://getcaddy.com | bash -s personal $PLUGINS

# expose ports
EXPOSE 80 443 2015

ENTRYPOINT ["/usr/local/bin/caddy"]

CMD ["-agree", "-conf", "/var/lib/caddy/Caddyfile"]

