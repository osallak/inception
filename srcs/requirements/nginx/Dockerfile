FROM debian:stable

RUN apt-get update && apt-get install -y \
    nginx \
    wget \
    libnss3-tools

RUN mkdir -p /etc/nginx/ssl && \
    wget https://github.com/FiloSottile/mkcert/releases/download/v1.4.3/mkcert-v1.4.3-linux-amd64 -O /usr/bin/mkcert && \
    chmod +x /usr/bin/mkcert && \
    mkcert -install && \
    mkcert -cert-file /etc/nginx/ssl/osallak.42.fr.crt -key-file /etc/nginx/ssl/osallak.42.fr.key osallak.42.fr

EXPOSE 443

COPY ./conf/nginx.conf  /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]