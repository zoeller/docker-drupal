#!/usr/bin/env bash
curl -LS https://github.com/drush-ops/drush/releases/download/8.1.15/drush.phar -o drush.phar
mv drush.phar /usr/local/bin/drush
chmod +x /usr/local/bin/drush