FROM php:7.1-apache-jessie
MAINTAINER Alexandre Schwartzmann <schwartzmann.a@gmail.com>

LABEL version="1.0"
LABEL os-version="debian:jessie"
LABEL apache-version="2.4"
LABEL php-version="7.1"

ADD picocms.conf /etc/apache2/sites-available/

RUN apt-get update && apt-get -y install apt-transport-https wget vim unzip php7-zip php7-gd
RUN a2enmod rewrite
RUN a2dissite 000-default
RUN a2ensite picocms

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
