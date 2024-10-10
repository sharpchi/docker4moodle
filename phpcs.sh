#!/bin/bash
CHECKPATH="web/html"
if [ "${1}" != "" ]; then
        CHECKPATH="web/html/${1}"
fi

./vendor/bin/phpcs --standard=PHPCompatibility \
    --runtime-set testVersion 7.3-8.1 \
    --extensions=php \
    --ignore=$CHECKPATH/local/codechecker/,$CHECKPATH/local/moodlecheck/,$CHECKPATH/node_modules/,$CHECKPATH/vendor/ \
    --cache=/tmp/cache -p $CHECKPATH
