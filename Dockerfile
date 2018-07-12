FROM alpine:3.6

ARG BUILD_DATE
ARG BUILD_VERSION

LABEL build_version="${BUILD_VERSION}"
LABEL build_date="${BUILD_DATE}"
LABEL maintainer="kylemharding@gmail.com"

# default plugins
ARG PLUGINS="http.reauth,tls.dns.cloudflare"

# caddyfile path
ENV CADDY_FILE /usr/src/app/Caddyfile

# install curl
RUN apk add --no-cache curl

# install caddy
RUN curl https://getcaddy.com | bash -s personal $PLUGINS

# work in app dir
WORKDIR /usr/src/app

# copy src files
COPY start.sh index.html Caddyfile ./

# expose ports
EXPOSE 80 443 2015

# persist caddy data
VOLUME /usr/src/app

# run start script on boot
CMD ["/bin/sh", "start.sh"]
