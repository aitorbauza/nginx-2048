FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    nginx \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/CarlesCanals/2048 /var/www/html/2048

RUN rm -rf /var/www/html/index.nginx-debian.html && \
    cp -r /var/www/html/2048/* /var/www/html/ && \
    rm -rf /var/www/html/2048

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]