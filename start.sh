#!/bin/sh
echo "starting web server"";
twistd web --listen=tcp:$PORT --path=./web/  &

echo "starting Bot";
python3 -m main