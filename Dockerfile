FROM ubuntu:18.04

RUN apt-get update && apt-get -y install nginx libnginx-mod-rtmp && \
      rm -rf /var/lib/apt/lists/*

COPY files/etc/ /etc/
COPY files/frontend/ /frontend/

ARG ALLOWED_IP=127.0.0.1

RUN sed -i 's/#allow publish ALLOWED_IP;/allow publish '"$ALLOWED_IP"';/' /etc/nginx/nginx.conf

EXPOSE 80
EXPOSE 443
EXPOSE 1935

ENTRYPOINT ["nginx", "-g", "daemon off;"]
