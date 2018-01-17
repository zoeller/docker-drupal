FROM php:7.1-fpm

WORKDIR /var/www

ENV XDEBUG_VERSION 2.5.4
ENV NODE_VERSION 8.6.0
#ENV NPM_VERSION 5.4.2
ENV PHP_MEMCACHED_VERSION 3.0.3

RUN docker-php-ext-enable opcache

RUN pecl channel-update pecl.php.net
RUN pecl install "xdebug-${XDEBUG_VERSION}"
RUN docker-php-ext-enable xdebug \
    && echo "xdebug.remote_enable=1" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.idekey=PHPSTORM" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_autostart=1" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_host=localhost" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_port=10000" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_connect_back=0" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_log=/var/log/xdebug.log" >> /usr/local/etc/php/conf.d/xdebug.ini

#    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \

RUN apt-get update
RUN apt-get dist-upgrade
RUN apt-get install -y git zip unzip

RUN curl -SLO "https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64.tar.gz" \
    && curl -SLO "https://nodejs.org/dist/v${NODE_VERSION}/SHASUMS256.txt.asc" \
    && tar -xzf "node-v${NODE_VERSION}-linux-x64.tar.gz" -C /usr/local --strip-components=1 \
    && rm "node-v${NODE_VERSION}-linux-x64.tar.gz" SHASUMS256.txt.asc

#RUN npm install -g npmlog update-notifier graceful-fs config-chain inherits nopt osenv umask has-unicode once ini \
#    mkdirp uid-number abbrev isexe glob rimraf lazy-property uuid slide write-file-atomic validate-npm-package-name \
#    bluebird cacache npm-package-arg chownr promise-retry protoduck mississippi minimatch normalize-package-data ssri \
#    promise-inflight safe-buffer aproba path-is-inside fs-vacuum read-cmd-shim \
#    && npm install -g npm \
#    && npm cache clear

RUN apt-get install -y pkg-config
RUN apt-get install -y libmemcached-dev zlib1g-dev
RUN pecl install "memcached-${PHP_MEMCACHED_VERSION}"
RUN docker-php-ext-enable memcached
RUN docker-php-ext-install pdo pdo_mysql bcmath

RUN apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng12-dev
RUN docker-php-ext-install gd

#RUN curl -S https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
#RUN chmod a+x /usr/local/bin/composer
#RUN curl -LS https://symfony.com/installer -o /usr/local/bin/symfony
#RUN chmod a+x /usr/local/bin/symfony
#RUN curl -LS https://github.com/drush-ops/drush/releases/download/8.1.15/drush.phar -o /usr/local/bin/drush
#RUN chmod a+x /usr/local/bin/drush

RUN apt-get update
RUN apt-get install -y mysql-client
RUN apt-get install -y python

#RUN php -r "readfile('https://s3.amazonaws.com/files.drush.org/drush.phar');" > drush \
#    && chmod +x drush \
#    && mv drush /usr/local/bin

RUN usermod -u 1000 www-data