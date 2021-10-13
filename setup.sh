#!/bin/bash
source setup.cfg

mkdir ${HTML_PATH}
mkdir ${MOODLEDATA_PATH}
chmod 777 ${MOODLEDATA_PATH}
mkdir "${WEB_PATH}/behatdata"
chmod 777 "${WEB_PATH}/behatdata"
mkdir "${WEB_PATH}/phpunitdata"
chmod 777 "${WEB_PATH}/phpunitdata"
mkdir "${WEB_PATH}/behatfaildumps"
chmod 777 "${WEB_PATH}/behatfaildumps"
mkdir mariadb
mkdir mariadb-init
