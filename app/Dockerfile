FROM php:8.1-apache

# Apache ENVs
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2/apache2.pid
ENV APACHE_SERVER_NAME 172.31.3.50


# Prepare apt
RUN apt-get update -y && \
    apt-get upgrade -y

# Prepare fake SSL certificate
RUN apt-get install -y ssl-cert
RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"
# Setup Apache2 mod_ssl
RUN a2enmod rewrite && a2enmod ssl

# Setup Apache2 HTTPS env
RUN a2ensite 000-default.conf && \
 a2ensite default-ssl.conf


RUN apt-get install nano -y && \
apt-get install zip -y
#ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

ADD https://github.com/mlocati/docker-php-extension-installer/releases/download/1.5.44/install-php-extensions /usr/local/bin/
RUN chmod +x /usr/local/bin/install-php-extensions
RUN install-php-extensions fileinfo mbstring openssl pdo_pgsql pdo_sqlite pgsql curl zip


# Work directory
#WORKDIR /var/www/html
#COPY ./var/www/mapas.fortaleza.ce.gov.br/mapa/ ./var/www/html
#COPY ./cert/hom-mapas.iplanfor.fortaleza.ce.gov.br.crt /etc/ssl/certs/hom-mapas.iplanfor.fortaleza.ce.gov.br.crt/
#COPY ./cert/hom-mapas.iplanfor.fortaleza.ce.gov.br.key /etc/ssl/private/hom-mapas.iplanfor.fortaleza.ce.gov.br.key/

# Permissao da pasta
 RUN chown -R www-data:www-data /var/www/
 RUN chmod -R g+s /var/www/

# Install composer
RUN cd /tmp && php -r "readfile('https://getcomposer.org/installer');" | php && \
        mv composer.phar /usr/bin/composer && \
        chmod +x /usr/bin/composer



# Expose Apache
EXPOSE 80
EXPOSE 443

RUN service apache2 restart

# Launch Apache
CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]