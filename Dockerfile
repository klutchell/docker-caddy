# resin caddy image modified to run on arm32v7
# original source: https://github.com/resin-io/resin-caddy

FROM arm32v6/golang:1.9-alpine as build

LABEL maintainer="kylemharding@gmail.com"

RUN apk update
RUN apk add git
RUN go get github.com/mholt/caddy/caddy
RUN go get github.com/caddyserver/builds

WORKDIR $GOPATH/src/github.com/mholt/caddy/caddy
RUN go run build.go
RUN mkdir /out
RUN cp caddy /out/caddy

FROM arm32v6/alpine:3.7

COPY --from=build /out/caddy /usr/local/bin/caddy

EXPOSE 80 443 2015
ENTRYPOINT ["/usr/local/bin/caddy"]
CMD ["-agree", "-conf", "/var/lib/caddy/Caddyfile"]

