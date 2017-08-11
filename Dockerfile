FROM debian:8 

ADD txt/header.txt /root

RUN echo "127.0.0.1  example.com  example" >> /etc/hosts; \
  echo "deb http://packages.hubzero.org/deb ellie-deb8 main" >> /etc/apt/sources.list; \
  echo "deb http://ftp.us.debian.org/debian jessie main" >> /etc/apt/sources.list; \
  echo "deb http://ftp.nl.debian.org/debian jessie main" >> /etc/apt/sources.list; \
  echo "deb http://http.debian.net/debian jessie-backports main" >> /etc/apt/sources.list; \
  apt-key adv --keyserver pgp.key-server.io --recv-keys 47B5DBAB0FCA9BAC; \
  apt-key adv --keyserver pgp.key-server.io --recv-keys 94532124541922FB; \
  apt-get update; \
  DEBIAN_FRONTEND=noninteractive apt-get --no-install-recommends install --force-yes --yes \
      wget bzip2 binutils ca-certificates sudo vim tree less rsync ssh git \
			mysql-server mysql-client apache2 hubzero-cms-2.1.0 hubzero-cli poppler-utils; \
	service mysql start;  \

  ln -s /usr/share/hubzero-cms-2.1.0 /usr/share/hubzero-cms; \
  ln -s /usr/share/hubzero-cms-2.1.0/cms/core/bootstrap/install /usr/share/hubzero-cms-2.1.0/cms/installation; \
  hzcms install example; \
  hzcms update;

# Apache config - JBG
RUN mv /etc/apache2/sites-available/example /etc/apache2/sites-available/example.conf
RUN mv /etc/apache2/sites-available/example-ssl /etc/apache2/sites-available/example-ssl.conf
ADD apache/example.conf /etc/apache2/sites-available/example.conf
ADD apache/example-ssl.conf /etc/apache2/sites-available/example-ssl.conf

ADD apache/ssl-cert-snakeoil.pem /etc/ssl/certs/ssl-cert-snakeoil.pem
ADD apache/ssl-cert-snakeoil.key /etc/ssl/private/ssl-cert-snakeoil.key

RUN a2enmod proxy; \
	a2enmod proxy_http; \
	a2ensite example example-ssl

WORKDIR /root

RUN cat /root/header.txt; \
	cat /etc/hubzero.secrets

EXPOSE 443 
ADD ./run.sh /run.sh
CMD /run.sh

