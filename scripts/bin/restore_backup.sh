#!/bin/bash

# DRIVE=/media/clemens/backup_drive
# SOURCE=$DRIVE/250131/
# TARGET=$HOME/
# MNT=/run/media/clemens/backup_drive/

SOURCE=/home/clemens/tmp/home/clemens
TARGET=$HOME/
MNT=/home/clemens/tmp/


today=$(date +'%Y%m%d')
time=$(date +'%H%M')
DEL=$HOME/.bu/Deleted/${today}
LOGDIR=$HOME/.bu/log/${today}

mkdir -p $LOGDIR

if mountpoint -q $MNT; then
  # rsync -abv --delete --backup-dir=$DEL $SOURCE/Documents/ $TARGET/Documents/ &>$LOGDIR/${time}_Documents.log
  rsync -abv --delete --dry-run --backup-dir=$DEL $SOURCE/Documents/ $TARGET/Documents/ &>$LOGDIR/${time}_Documents.log
  # cp -r $HOME/Desktop/Steuerklärung $HOME/Documents/Clemens/Finanzen/Steuern/Steuererklärung/2024/Steuerklärung

else
  echo "\n/media/clemens/backup_drive/ is not not mounted"
fi
