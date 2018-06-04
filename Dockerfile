FROM arm32v6/golang:1.9-alpine as build

LABEL maintainer="kylemharding@gmail.com"

ENV plugins "github.com/freman/caddy-reauth github.com/caddyserver/dnsproviders/tree/master/cloudflare"

RUN apk add --no-cache git sed

RUN go get github.com/mholt/caddy/caddy
RUN go get github.com/caddyserver/builds

WORKDIR $GOPATH/src/github.com/mholt/caddy/caddy

RUN for plugin_url in plugins; do \
	sed -r -i "/(imported)/a _ \"$plugin_url\"" caddymain/run.go; \
	done

RUN go run build.go

RUN mkdir /out && cp caddy /out/caddy

FROM arm32v6/alpine:3.7

COPY --from=build /out/caddy /usr/local/bin/caddy

EXPOSE 80 443 2015

ENTRYPOINT ["/usr/local/bin/caddy"]

CMD ["-agree", "-conf", "/var/lib/caddy/Caddyfile"]

