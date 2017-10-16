# Docker

$ sudo docker-compose up

# Composer

Install Composer (globally)

Run

```
$ sudo docker-compose exec php bash setup/install-composer.sh
```

or

```
$ sudo docker-compose exec php curl -LS https://getcomposer.org/installer -o composer-setup.php
$ sudo docker-compose exec php php composer-setup.php
$ sudo docker-compose exec php rm composer-setup.php
$ sudo docker-compose exec php cp composer.phar /usr/local/bin/composer
$ sudo docker-compose exec php chmod +x /usr/local/bin/composer
```

# Drush

Install Drush (globally)

Run

```
$ sudo docker-compose exec php bash setup/install-drush.sh
```

or

```
$ sudo docker-compose exec php curl -LS https://github.com/drush-ops/drush/releases/download/8.1.15/drush.phar -o drush.phar
$ sudo docker-compose exec php mv drush.phar /usr/local/bin/drush
$ sudo docker-compose exec php chmod +x /usr/local/bin/drush
```

## Init Drush

```
$ sudo docker-compose exec --user www-data php drush init
```

# Drupal

```
$ sudo docker-compose exec --user www-data php composer create-project drupal-composer/drupal-project:8.x-dev src --stability dev --no-interaction
$ sudo docker-compose exec --user www-data php drush --root=/var/www/src/web site-install -y standard --db-url=mysql://drupal:pass@mysql/drupal
$ sudo docker-compose exec --user www-data php drush --root=/var/www/src/web site-install -y standard --db-url=mysql://drupal:pass@mysql/drupal --site-name=ExampleSite --account-name=admin --account-pass=admin
```

Then check IP and open browser, e.g. http://172.20.0.1

## Useful commands

```
$ sudo docker-compose exec --user www-data php drush --root=/var/www/src/web user-password admin --password='pass'
$ sudo docker-compose exec --user www-data php drush --root=/var/www/src/web user-create zoeller --password='pass'
$ sudo docker-compose exec --user www-data php drush --root=/var/www/src/web status
```

## Modules

```
$ sudo docker-compose exec --user www-data php composer update
$ sudo docker-compose exec --user www-data php composer require drupal/devel ^1.2.*@dev
$ sudo docker-compose exec --user www-data php drush --root=/var/www/src/web pm-enable -y devel
$ sudo docker-compose exec --user www-data php composer require drupal/admin_toolbar ^1.20
$ sudo docker-compose exec --user www-data php drush --root=/var/www/src/web pm-enable -y admin_toolbar
$ sudo docker-compose exec --user www-data php composer require drupal/paragraphs ^1.2
$ sudo docker-compose exec --user www-data php drush --root=/var/www/src/web pm-enable -y paragraphs
$ sudo docker-compose exec --user www-data php composer require drupal/honeypot ^1.27
$ sudo docker-compose exec --user www-data php drush --root=/var/www/src/web pm-enable -y honeypot
$ sudo docker-compose exec --user www-data php composer require drupal/metatag ^1.3
$ sudo docker-compose exec --user www-data php drush --root=/var/www/src/web pm-enable -y metatag
$ sudo docker-compose exec --user www-data php composer require drupal/seo_checklist ^4.0
$ sudo docker-compose exec --user www-data php drush --root=/var/www/src/web pm-enable -y seo_checklist
```