FROM debian:bookworm

RUN apt update
RUN apt install nginx -y
RUN apt-get install vim -y
RUN apt-get install curl -y
RUN apt-get install openssl -y
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=ael-youb.42.fr/UID=ael-youb"
RUN mkdir -p /var/run/nginx
COPY conf/nginx.conf /etc/nginx/conf.d
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]