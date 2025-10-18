#!/bin/bash
#
## $Revision:001S
## The current date is: Fri 10/17/2025
#
## Variables
BASE="/mnt/c/Users/samue/Desktop/sample"
DAYS=10
DEPTH=1
RUN=0
ARCHIVE_DIR="$BASE/archive"
#
### Check if the directory is present or not
if [ ! -d "$BASE" ]; then
    echo "Directory does not exist: $BASE"
        exit 1
        fi

## Create 'archive' folder if not present
if [ ! -d "$ARCHIVE_DIR" ]; then
	mkdir "$ARCHIVE_DIR"
fi

## Find the list of files larger than 20MB
for i in $(find "$BASE" -maxdepth $DEPTH -type f -size +20M); do
	if [ $RUN -eq 0 ]; then
		echo "[$(date "+%Y-%m-%d %H:%M:%S")] Archiving $i ==> $ARCHIVE_DIR"
		gzip "$i" || exit 1
		mv "$i.gz" "$ARCHIVE_DIR" || exit 1
	fi
done
                                            

