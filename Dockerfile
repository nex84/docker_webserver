FROM debian:stretch
MAINTAINER Alexandre Schwartzmann <schwartzmann.a@gmail.com>

LABEL version="1.0"
LABEL os-version="debian:stretch"
LABEL apache-version="2.4"
LABEL php-version="5.6"

ADD vhost.conf /etc/apache2/sites-available/

RUN apt-get update && apt-get -y install apt-transport-https wget vim unzip gnupg apache2 php5 libapache2-mod-php5 php5-curl php5-gd php5-mbstring php5-mcrypt php5-mysql php5-xml php5-zip

RUN a2enmod rewrite
RUN a2dissite 000-default
RUN a2ensite vhost

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
