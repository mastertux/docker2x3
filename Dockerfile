FROM mastertux/php5-apache2

ENV APP_ROOT /var/www/app
ENV APACHE_RUN_USER  www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR   /var/log/apache2
ENV APACHE_PID_FILE  /var/run/apache2/apache2.pid
ENV APACHE_RUN_DIR   /var/run/apache2
ENV APACHE_LOCK_DIR  /var/lock/apache2
ENV APACHE_LOG_DIR   /var/log/apache2

RUN mkdir -p $APP_ROOT
RUN mkdir -p $APACHE_RUN_DIR
RUN mkdir -p $APACHE_LOCK_DIR
RUN mkdir -p $APACHE_LOG_DIR

WORKDIR $APP_ROOT
COPY . $APP_ROOT
RUN mv start.sh /usr/bin

EXPOSE  80
CMD ["/usr/bin/start.sh"]
