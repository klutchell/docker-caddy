#!/bin/sh

/usr/local/bin/caddy -agree -conf "${CADDY_FILE}" -email "${CADDY_EMAIL}" -root "${CADDY_ROOT}"
