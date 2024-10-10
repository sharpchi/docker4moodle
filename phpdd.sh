#!/bin/bash
CHECKPATH="web/html"
if [ "${1}" != "" ]; then
        CHECKPATH="web/html/${1}"
fi

#./vendor/bin/phpdd scan -t 8.2 -a 8.1 -e codechecker,moodlecheck,node_modules,vendor $CHECKPATH
./vendor/bin/phpdd scan -t 8.1 -a 8.0 -e codechecker,moodlecheck,node_modules,vendor $CHECKPATH
./vendor/bin/phpdd scan -t 8.0 -a 7.4 -e codechecker,moodlecheck,node_modules,vendor $CHECKPATH
./vendor/bin/phpdd scan -t 7.4 -a 7.4 -e codechecker,moodlecheck,node_modules,vendor $CHECKPATH