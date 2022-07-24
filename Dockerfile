FROM python:3.9.2-slim-buster

WORKDIR /app
COPY . .

# ENV DEBIAN_FRONTEND=noninteractive

RUN apt -qq update && apt -qq install -y git python3 python3-pip ffmpeg nginx bash \                          
    && pip3 install --no-cache-dir -q -r requirements.txt \
    && chmod +x start.sh \
    && chmod 777 /app/* \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone 

COPY default.conf.template /etc/nginx/conf.d/default.conf.template
COPY nginx.conf /etc/nginx/nginx.conf
COPY static-html /usr/share/nginx/html

# Run the app
# CMD ["python3","-m","main"]
ENTRYPOINT ["./start.sh"]

