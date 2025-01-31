#!/bin/bash

DRIVE=/media/clemens/backup_drive
TARGET=$DRIVE/250131/
SOURCE=$HOME/

DEL=$DRIVE/Deleted

today=$(date +'%Y%m%d')
LOGDIR=$DRIVE/log/${today}

mkdir -p $LOGDIR
time=$(date +'%H%M')

if mountpoint -q /media/clemens/backup_drive/; then
  rsync -abv --delete --backup-dir=$DEL $SOURCE $TARGET &>$LOGDIR/${time}_HOME.log
else
  echo "\n/media/clemens/backup_drive/ is not not mounted"
fi
