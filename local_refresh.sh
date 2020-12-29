#!/usr/bin/env bash

set -x; #echo on

# Intialize script duration in seconds
SECONDS=0;

# Setup a clean local environment
rm -rf vendor;
rm -rf web/modules/contrib;
rm -rf web/themes/custom/fod_theme/node_modules;
composer install;
chmod 444 web/sites/default/settings.php;
cd web/themes/custom/fod_theme;
source ~/.nvm/nvm.sh;
nvm use;
npm install;
ddev . drush cr
npm run build;
# npm run watch;

# Calculate elapsed time
duration=$SECONDS

# Print script elapsed time in minutes and seconds
echo "It took $(($duration / 60)) minutes and $(($duration % 60)) seconds to complete this operation."
