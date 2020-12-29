#!/usr/bin/env bash
#Setup a clean local environment
# set -x; #echo on

# Intialize script duration in seconds
SECONDS=0;

# Enable core modules
ddev . drush en admin_toolbar admin_toolbar_tools content_moderation media media_library responsive_image update -y;

# Install contrib modules
composer require 'drush/drush' 'drupal/components' 'drupal/crop' 'drupal/devel' 'drupal/entity_reference_revisions' 'drupal/focal_point' 'drupal/module_filter' 'drupal/paragraphs' 'drupal/twig_field_value' 'drupal/twig_tweak:^2.9' 'drupal/viewsreference';

# Enable contrib modules
ddev . drush en components crop devel entity_reference_revisions focal_point module_filter paragraphs twig_field_value twig_tweak viewsreference -y;

# Rebuild Drupal caches
ddev . drush cr

# Calculate elapsed time
duration=$SECONDS

# Print script elapsed time in minutes and seconds
echo "It took $(($duration / 60)) minutes and $(($duration % 60)) seconds to complete this operation."
