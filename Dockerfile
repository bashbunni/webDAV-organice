FROM ubuntu/apache2:latest

ADD ./webdav.conf /etc/apache2/sites-available/webdav.conf

RUN a2enmod headers
RUN a2enmod dav*
RUN a2enmod rewrite
RUN a2ensite webdav


RUN mkdir /srv/dav
RUN chmod 770 /srv/dav
RUN chown www-data. /srv/dav

CMD apachectl -D FOREGROUND
EXPOSE 80
