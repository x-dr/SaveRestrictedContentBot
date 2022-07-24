FROM python:3.8.13-alpine3.15

WORKDIR /app
COPY . .

ENV DEBIAN_FRONTEND=noninteractive

RUN apk add --no-cache --update  bash ffmpeg  \                          
    && pip3 install --no-cache-dir -q -r requirements.txt \
    && rm -rf /var/cache/apk/* \
    && chmod +x start.sh \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone 


# Run the app
CMD ["python3","-m","WebStreamer"]
