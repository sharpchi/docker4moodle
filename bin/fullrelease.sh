#!/bin/bash

echo "======="
echo "Running full upgrade"
echo "======="

echo "======="
echo "Renaming old folder and recreating"
echo "======="

NOW=$(date +"%Y-%m-%d")

sudo mv /var/www/html "/var/www/html_$NOW"
sudo mkdir /var/www/html
sudo chown -R www-data:www-data /var/www/html

echo "======"
echo "Copying back config.php file"
echo "======"

cp "/var/www/html_$NOW/config.php" /var/www/html/config.php

./pointrelease.sh
