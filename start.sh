#!/bin/bash
echo "starting nginx"

/bin/sh -c bash "envsubst '\$PORT' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf" && nginx -g 'daemon off;'

echo "starting Bot";
python3 -m main