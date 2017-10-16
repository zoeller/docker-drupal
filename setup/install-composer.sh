#!/usr/bin/env bash
curl -LS https://getcomposer.org/installer -o composer-setup.php
php composer-setup.php
rm composer-setup.php
cp composer.phar /usr/local/bin/composer
chmod +x /usr/local/bin/composer