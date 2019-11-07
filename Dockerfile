FROM ubuntu:18.04

RUN apt update && apt -y install nginx libnginx-mod-rtmp && \
      rm -rf /var/lib/apt/lists/*

COPY files/etc/ /etc/

#COPY frontend/ /frontend/

ENTRYPOINT ["nginx", "-g", "daemon off;"]
