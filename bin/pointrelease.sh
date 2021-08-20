#!/bin/bash
echo '=========='
echo 'Running pointrelease.sh'
echo '=========='

printf 'This will:\n i)   Fetch the lastest Moodle release\n ii)  Merge in our updates\n iii) Fix any file permissions issues\n iv)  Run Moodle upgrade.\n'
read -p "Press [Enter] to continue."

echo '=========='
echo "Switching on Maintenance mode"
echo '=========='
sudo -u www-data php /var/www/html/admin/cli/maintenance.php --enable

echo '=========='
echo "Syncronising the lastest Moodle release"
echo '=========='
rsync -avz ./moodle-39/ /var/www/html/
# or your fork of Moodle

./quick_sync.sh

echo '=========='
echo "All files sychronised on $(hostname)"
echo '=========='

read -p "Ensure all files are synchronised on all systems before continuing. Press [Enter] to continue"

echo '=========='
echo "Running Moodle upgrade"
echo '=========='
sudo -u www-data php /var/www/html/admin/cli/upgrade.php

echo '=========='
echo "Switching off Maintenance mode"
echo '=========='
sudo -u www-data php /var/www/html/admin/cli/maintenance.php --disable
