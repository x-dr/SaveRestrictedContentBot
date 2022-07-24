#!/bin/sh

# Run nginx
/bin/bash -c "envsubst '\$PORT' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf" && nginx -g 'daemon off;'


echo "starting Bot ~@xzmmmmdd_bot";
python3 -m main