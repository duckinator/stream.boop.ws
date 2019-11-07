FROM ubuntu:18.04

RUN apt-get update && apt-get -y install nginx libnginx-mod-rtmp && \
      rm -rf /var/lib/apt/lists/*

COPY files/etc/ /etc/

#COPY frontend/ /frontend/

EXPOSE 80
EXPOSE 443
EXPOSE 1935

ENTRYPOINT ["nginx", "-g", "daemon off;"]
