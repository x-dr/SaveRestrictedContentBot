FROM nginx:1.23.1-alpine

WORKDIR /app
COPY . .

# ENV DEBIAN_FRONTEND=noninteractive
RUN apk add --no-cache --update  bash  curl unzip php7 git python3 py3-pip ffmpeg \                       
    && pip3 install --no-cache-dir -q -r requirements.txt \
    && chmod +x start.sh \
    && chmod 777 /app/* \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && mkdir -p /usr/share/nginx/html/index

COPY nginx/default.conf.template /etc/nginx/conf.d/default.conf.template
COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY nginx/index.html /usr/share/nginx/html/index/
COPY nginx/tgpic /usr/share/nginx/html/tgpic


# Run the app
# CMD ["python3","-m","main"]
ENTRYPOINT ["sh","./start.sh"]

