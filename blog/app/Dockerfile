FROM wordpress

ARG APP_UID
ARG APP_GID

RUN groupmod -g $APP_GID www-data \
    && usermod -u $APP_UID www-data \
    && chown -R www-data:www-data /usr/src/wordpress
