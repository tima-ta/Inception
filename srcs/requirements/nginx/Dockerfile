FROM debian:oldstable

RUN apt-get update ; \
    apt-get install nginx -y

RUN mkdir -p /etc/nginx/ssl ; \
    apt-get install openssl -y ; \
    openssl req -new -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/inception.key -out /etc/nginx/ssl/inception.crt -subj "/C=MA/ST=RG/L=Khouribga/O=1337/OU=1337/CN=fraqioui.42.fr/UID=fraqioui"

COPY conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]
