FROM richarvey/nginx-php-fpm:latest

RUN rm -rf /var/www/html

COPY app /var/www/html

# Laravel specific config
RUN sed 's/html;/html\/public;/' /etc/nginx/sites-available/default.conf; \
    chown -R www-data:www-data /var/www/html;
    chmod -R ug+rwx /var/www/html/storage; \
    chmod -R ug+rwx /var/www/html/bootstrap/cache;
