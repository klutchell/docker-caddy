# resin caddy image modified to run on arm32v7
# original source: https://github.com/resin-io/resin-caddy

FROM armhf/golang as build

LABEL maintainer="kylemharding@gmail.com"

RUN go get github.com/mholt/caddy/caddy
RUN go get github.com/caddyserver/builds

WORKDIR $GOPATH/src/github.com/mholt/caddy/caddy

RUN go run build.go

RUN mkdir /out

RUN cp caddy /out/caddy

FROM armhf/alpine

COPY --from=build /out/caddy /usr/local/bin/caddy

EXPOSE 80 443 2015

ENTRYPOINT ["/usr/local/bin/caddy"]

CMD ["-agree", "-conf", "/var/lib/caddy/Caddyfile"]
