#!/bin/bash
echo '=========='
echo "Running quick_sync.sh"
echo '=========='

echo "Note: This will update www and moodledata/lang.  If you need to update all moodledata, change the file."

echo '=========='
echo "Syncronising moodle_migration"
echo '=========='

rsync -avz ./moodleextra/htdocs/ /var/www/html/
rsync -avz ./moodleextra/moodledata/lang/ /var/www/moodledata/lang/

echo "=========="
echo "Running patches"
echo "=========="
./patches.sh

    