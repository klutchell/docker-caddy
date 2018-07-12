#!/bin/sh

/usr/local/bin/caddy -agree -conf "${CADDY_FILE}" -email "${ACME_EMAIL}"
