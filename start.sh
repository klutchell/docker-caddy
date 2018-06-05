#!/bin/bash

/usr/local/bin/caddy -agree -conf "$CADDY_FILE" -email "$ACME_EMAIL"
