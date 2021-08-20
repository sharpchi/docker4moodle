#!/bin/bash
if [ $# -lt 1 ]
then
        echo "Specify a version, usually somethin like \"32\""
        echo "Moodle publishes a weekly update which is indicated with a + sign after the version (e.g. 3.6.6+)"
        echo "See https://download.moodle.org/releases/security/ or https://download.moodle.org/releases/latest/"
        echo "A new point release is released when there are security updates (e.g. 3.6.6), the first week of"
        echo "the point release, you need to specify the point release version e.g."
        echo "./getversion.sh 36 3.6.7"
        echo ""
        echo "Normal usuage just requires:"
        echo "./getversion.sh 36"
        exit
fi

STABLE="stable${1}"
FILE="moodle-latest-${1}.tgz"
if [ "${2}" != "" ]; then
        FILE="moodle-${2}.tgz"
fi

echo ${1}
echo $STABLE
echo $FILE

if [ -f "$FILE" ]
then
        rm "$FILE"
        rm -R "moodle-${1}"
fi

if wget "https://download.moodle.org/download.php/direct/$STABLE/$FILE"; then
        if [ -d "moodle-${1}" ]; then
                rm -r "moodle-${1}"
        fi
        tar -xzf "$FILE"
        mv moodle "moodle-${1}"
fi
