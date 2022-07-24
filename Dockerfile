FROM python:3.9.2-slim-buster

WORKDIR /app
COPY . .

# ENV DEBIAN_FRONTEND=noninteractive
RUN apt -qq update && apt -qq install -y bash python3 python3-pip ffmpeg  \                       
    && pip3 install --no-cache-dir -q -r requirements.txt \
    && chmod +x start.sh \
    && chmod 777 /app/* \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && mkdir -p /usr/share/nginx/html/index 
    # && add-apt-repository ppa:ondrej/php \
    # && apt -qq update && apt -qq install -y php7.3 php7.3-fpm 



# Run the app
# CMD ["python3","-m","main"]
ENTRYPOINT ["sh","./start.sh"]

