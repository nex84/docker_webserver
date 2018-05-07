FROM php:7.1-apache-jessie
MAINTAINER Alexandre Schwartzmann <schwartzmann.a@gmail.com>

LABEL version="1.0"
LABEL os-version="debian:jessie"
LABEL apache-version="2.4"
LABEL php-version="7.1"

ADD vhost.conf /etc/apache2/sites-available/

RUN echo "deb https://packages.sury.org/php/ jessie main" >> /etc/apt/sources.list
RUN wget https://packages.sury.org/php/apt.gpg && apt-key add apt.gpg && rm apt.gpg
RUN apt-get update && apt-get -y install apt-transport-https wget vim unzip php7.1-zip php7.1-gd

RUN a2enmod rewrite
RUN a2dissite 000-default
RUN a2ensite vhost

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
