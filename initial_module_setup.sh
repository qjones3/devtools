#!/usr/bin/env bash
#Setup a clean local environment
set -x; #echo on

# Install contrib modules
composer require drush/drush drupal/crop:^2.1 drupal/devel:^4.0 drupal/entity_reference_revisions:^1.8 drupal/focal_point:^1.5 drupal/module_filter:^3.1 drupal/paragraphs:^1.12 drupal/twig_field_value:^2.0 drupal/twig_tweak:^2.9 drupal/viewsreference:^1.6;

# Enable core modules
ddev . drush en admin_toolbar admin_toolbar_tools components media media_library responsive_image update -y;

# Enable contrib modules
ddev . drush en  crop devel entity_reference_revisions focal_point module_filter paragraphs twig_field_value twig_tweak viewsreference -y;

# Rebuild Drupal caches
ddev . drush cr
