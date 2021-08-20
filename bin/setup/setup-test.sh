#!/bin/bash
source setup.sh; # load the config & library functions

set -o allexport; source .env; set +o allexport

if [ ! -f ".env" ]; then
    echo "You need to install your .env file before continuing."
    exit
fi

git submodule update --init --recursive

while getopts "v:r:b:" opt
do
   case "$opt" in
      v ) VERSION="$OPTARG" ;;
      r ) RELEASE="$OPTARG" ;;
      b ) BRANCH="$OPTARG" ;;
      ? ) echo "Error: Unexpected option used." ;; # Runs when parameter is not in the list
   esac
done

BIN_PATH="bin"
cd ${BIN_PATH}
if [ ${VERSION} == "" ]; then
    exit
fi
./getmoodle.sh ${VERSION} ${RELEASE}

read -p "Press [Enter] to continue."

rsync -az "${BIN_PATH}/moodle-${VERSION}/" "${HTML_PATH}/"

read -p "Press [Enter] to continue."

cd ${MOODLEEXTRA_PATH}
if [ "${BRANCH}" != "" ]; then
    git checkout ${BRANCH}
fi
read -p "Press [Enter] to continue."
rsync -az "${MOODLEEXTRA_PATH}/moodle/htdocs/" "${HTML_PATH}/"
rsync -az "${MOODLEEXTRA_PATH}/moodle/moodledata/lang/" "${MOODLEDATA_PATH}/lang/"
chmod 777 -R ${MOODLEDATA_PATH}
cp "${WEB_PATH}/config.docker-template.php" "${HTML_PATH}/config.php"

echo "Now start your docker and run admin/cli/upgrade.php or "
echo "php admin/cli/install_database.php --agree-license --fullname=${PROJECT_NAME} --shortname ${PROJECT_NAME} --adminpass=${DB_PASSWORD}"
echo "in your container console."