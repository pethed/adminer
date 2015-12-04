FROM debian
MAINTAINER Peter Hedman

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y nginx wget php5-fpm 
RUN wget http://www.adminer.org/latest.php
# copy latest.php till index.php
RUN mkdir /var/www/
RUN mv latest.php /var/www/index.php
# Edit /etc/php5/fpm/php.ini
RUN sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/' /etc/php5/fpm/php.ini
# Edit /etc/nginx/sites-available/default
ADD default /etc/nginx/sites-available/default

EXPOSE 80 

CMD ["service php5-fpm start"]
CMD ["service nginx start"]

