FROM alpine:3.6

ARG BUILD_DATE
ARG BUILD_VERSION

LABEL build_version="${BUILD_VERSION}"
LABEL build_date="${BUILD_DATE}"
LABEL maintainer="kylemharding@gmail.com"

# default plugins
ARG PLUGINS="http.reauth,tls.dns.cloudflare,http.git,http.filemanager,http.cors,http.realip,http.expires,http.cache"

# caddyfile env vars
ENV CADDY_ROOT /www
ENV CADDY_FILE /www/Caddyfile

# install curl, bash, gnupg, and tzdata
RUN apk add --no-cache curl bash tzdata gnupg

# install caddy
RUN curl -sSL https://getcaddy.com | bash -s personal $PLUGINS

# work in app dir
WORKDIR /usr/src/app

# copy src files
COPY start.sh ./

# work in caddy root
WORKDIR ${CADDY_ROOT}

# copy src files
COPY index.html Caddyfile ./

# persist caddy root
VOLUME ${CADDY_ROOT}

# expose ports
EXPOSE 80 443 2015

# run start script on boot
CMD ["/bin/sh", "/usr/src/app/start.sh"]
