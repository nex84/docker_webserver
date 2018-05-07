FROM ubuntu:latest
MAINTAINER Alexandre Schwartzmann <schwartzmann.a@gmail.com>

LABEL version="1.0"
LABEL os-version="debian:stretch"
LABEL apache-version="2.4"
LABEL php-version="5.6"

ADD vhost.conf /etc/apache2/sites-available/

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y update && apt-get install -y \
apache2 \
php7.2 \
libapache2-mod-php7.2 \
php7.2-gd \
php7.2-zip \
php7.2-json \
php7.2-mysqlnd \
php7.2-mbstring

RUN a2enmod rewrite
RUN a2dissite 000-default
RUN a2ensite vhost

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
