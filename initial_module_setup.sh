#!/usr/bin/env bash
#Setup a clean local environment
set -x; #echo on

# Enable core modules
ddev . drush en admin_toolbar admin_toolbar_tools components media media_library module_filter responsive_image twig_tweak twig_field_value update -y;

# Install contrib modules
composer require drush/drush drupal/paragraphs drupal/entity_reference_revisions drupal/devel drupal/focal_point drupal/crop drupal/viewsreference;

# Enable contrib modules
ddev . drush en paragraphs entity_reference_revisions devel focal_point crop viewsreference -y;

# Rebuild Drupal caches
ddev . drush cr
