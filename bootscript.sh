#!/bin/bash

#wait for other microservices to boot;
sleep 30s;

#drush reference
#    vendor/drush/drush/drush pm:enable migrate migrate_drupal migrate_drupal_ui \
#    vendor/drush/drush/drush pm:enable workflows content_moderation
#    vendor/drush/drush/drush pm:enable layout_builder layout_discovery field_layout \
#    vendor/drush/drush/drush -qny --db-url="sqlite:sites/default/files/.basesqlite" si;
#    vendor/drush/drush/drush -n cr
#    vendor/drush/drush/drush -n cex --destination backup
#    vendor/drush/drush/drush config-get "system.site" uuid
#    vendor/drush/drush/drush config-set "system.site" uuid "fjfj34-e3bb-2ab8-4d21-9100-b5etgetgd99d5"

#create an empty minimal site
/opt/drupal/vendor/drush/drush/drush -qny --db-url="mysql://exampleuser:examplepass@db:3306/drupal" si minimal;

#set uuid to a consistent value
/opt/drupal/vendor/drush/drush/drush config-get "system.site" uuid
/opt/drupal/vendor/drush/drush/drush config-set "system.site" uuid "b1dc23f4-54d9-40fa-a880-feb4dceb7047"
/opt/drupal/vendor/drush/drush/drush config-get "system.site" uuid

#copy customisations made from previous runs
cp sync/* web/sites/default/files/config_*/sync; 
cp -r files/* web/sites/default/files;

#import those customisations
/opt/drupal/vendor/drush/drush/drush -qny --existing-config --db-url="mysql://exampleuser:examplepass@db:3306/drupal" si;

#run the web server
/usr/sbin/apachectl start;

#never exit
sleep infinity;
