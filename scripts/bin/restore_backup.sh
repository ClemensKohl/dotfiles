#!/bin/bash

DRIVE=/media/clemens/backup_drive
SOURCE=$DRIVE/250131/
TARGET=$HOME/

DEL=$HOME/.bu/Deleted

today=$(date +'%Y%m%d')
LOGDIR=$HOME/.bu/log/${today}

mkdir -p $LOGDIR
time=$(date +'%H%M')

if mountpoint -q /media/clemens/backup_drive/; then
  rsync -abv --delete --backup-dir=$DEL $SOURCE/Documents/ $TARGET/Documents/ &>$LOGDIR/${time}_Documents.log
else
  echo "\n/media/clemens/backup_drive/ is not not mounted"
fi
