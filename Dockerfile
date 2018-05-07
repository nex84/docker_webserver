FROM ubuntu:latest
MAINTAINER Alexandre Schwartzmann <schwartzmann.a@gmail.com>

LABEL version="1.0"
LABEL os-version="debian:stretch"
LABEL apache-version="2.4"
LABEL php-version="5.6"

ADD vhost.conf /etc/apache2/sites-available/

RUN apt-get -y update && apt-get install -y \
apache2 \
php5 \
libapache2-mod-php5 \
php5-gd \
php5-zip \
php5-json \
php5-mysqlnd \
php5-mcrypt \
mcrypt

RUN a2enmod rewrite
RUN a2dissite 000-default
RUN a2ensite vhost

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
