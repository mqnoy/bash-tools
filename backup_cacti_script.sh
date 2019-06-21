#!/bin/bash
#
#
# usesless for exclude.txt ,i dont know :(
#
#
# mqnoy@2019
#

FILE_NAME="cacti_backup_$(date +\%d\_%m\_%Y).tar.gz"

#CACTI_LOCATION = "/usr/share/cacti/"

DST_PATH_BACKUPS="/home/backupcacti/"
#your directory
EXCLUDE_PATH="/home/_devops/exclude.txt"

echo "++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "|                                                |"
echo "| ++++++ cacti backup script exceuted +++++++++++|"
echo "|                                                |"
echo "+++++++++++++++++++++++++++++++++++++++++++++++++|"
echo "[INFO] $DST_PATH_BACKUPS "
echo "[INFO] Creating file in $DST_PATH_BACKUPS"

#tar cpzfP "$DST_PATH_BACKUPS" /usr/share/cacti/

echo "[INFO] enter share cacti dir"
cd /usr/share
tar cpzfP "$FILE_NAME" -X "$EXCLUDE_PATH"  "cacti/"


if [ ! -f $FILE_NAME ]; then
    echo "[ERROR] file not found ."
    exit 0;
else
    mv $FILE_NAME $DST_PATH_BACKUPS
    echo "[SUCCESS] file $DST_PATH_BACKUPS$FILE_NAME created"
fi
