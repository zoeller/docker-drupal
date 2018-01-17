#!/usr/bin/env bash
composer --working-dir=/var/www/src update
composer --working-dir=/var/www/src require drupal/devel ^1.2
drush --root=/var/www/src/web pm-enable -y devel
composer --working-dir=/var/www/src require drupal/admin_toolbar ^1.20
drush --root=/var/www/src/web pm-enable -y admin_toolbar
composer --working-dir=/var/www/src require drupal/paragraphs ^1.2
drush --root=/var/www/src/web pm-enable -y paragraphs
composer --working-dir=/var/www/src require drupal/honeypot ^1.27
drush --root=/var/www/src/web pm-enable -y honeypot
composer --working-dir=/var/www/src require drupal/metatag ^1.3
drush --root=/var/www/src/web pm-enable -y metatag
composer --working-dir=/var/www/src require drupal/seo_checklist ^4.0
drush --root=/var/www/src/web pm-enable -y seo_checklist
composer --working-dir=/var/www/src require drupal/pathauto ^1.0
drush --root=/var/www/src/web pm-enable -y pathauto