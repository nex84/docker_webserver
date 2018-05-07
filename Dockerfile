FROM debian:stretch-slim
MAINTAINER Alexandre Schwartzmann <schwartzmann.a@gmail.com>

LABEL version="1.0"
LABEL os-version="debian:stretch"
LABEL apache-version="2.4"
LABEL php-version="7.1"

ADD vhost.conf /etc/apache2/sites-available/

RUN apt-get update && apt-get -y install apt-transport-https wget vim unzip
RUN echo "deb https://packages.sury.org/php/ jessie main" >> /etc/apt/sources.list
RUN wget https://packages.sury.org/php/apt.gpg && apt-key add apt.gpg && rm apt.gpg
RUN apt-get update && apt-get -y install apache2 php7.1 libapache2-mod-php7.1 php7.1-cli php7.1-curl php7.1-gd php7.1-intl php7.1-mbstring php7.1-mcrypt php7.1-mysql php7.1-sqlite3 php7.1-xml php7.1-zip

RUN a2enmod rewrite
RUN a2dissite 000-default
RUN a2ensite vhost

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
