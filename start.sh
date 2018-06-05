#!/bin/sh

# start caddy server in the foreground
/usr/local/bin/caddy -agree -conf "$CADDY_FILE" -email "$ACME_EMAIL"