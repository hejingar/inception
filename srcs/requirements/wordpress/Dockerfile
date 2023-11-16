FROM debian:bullseye

RUN apt-get update
RUN apt-get upgrade
RUN apt-get install -y wget
RUN apt-get install -y php7.4 php-fpm php-mysql


RUN rm -rf /etc/php/7.4/fpm/pool.d/www.conf
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

RUN apt-get update && apt-get install -y default-mysql-client
RUN apt-get install -y mariadb-client

RUN wget https://wordpress.org/wordpress-6.1.1.tar.gz -P /var/www/html
RUN cd /var/www/html \
	&& tar -xzf /var/www/html/wordpress-6.1.1.tar.gz \
	&& rm /var/www/html/wordpress-6.1.1.tar.gz

RUN chown -R www-data:www-data /var/www/*
RUN chmod -R 755 /var/www/*

EXPOSE 9000

COPY ./tools/run_wp.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/run_wp.sh

ENTRYPOINT ["/usr/local/bin/run_wp.sh"]





# CMD ["/usr/sbin/php-fpm7.4", "-F"]


