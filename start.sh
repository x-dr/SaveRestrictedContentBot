#!/bin/sh
echo "starting web server"";
nohup python3 web.py &

echo "starting Bot";
python3 -m main