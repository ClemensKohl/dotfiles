#!/bin/bash

today=$(date +'%Y%m%d')
LOGDIR=$HOME/Pictures/logs/${today}

if mountpoint -q /media/clemens/Foto3/; then

  mkdir -p $LOGDIR
  time=$(date +'%H%M')

  rsync -abv --delete --backup-dir=$HOME/Pictures/Deleted /media/clemens/Foto3/digikam/ $HOME/Pictures/digikam/ &>$LOGDIR/${time}_digikam.log
  rsync -abv --delete --backup-dir=$HOME/Pictures/Deleted /media/clemens/Foto3/vaults/ $HOME/Pictures/vaults/ &>$LOGDIR/${time}_vaults.log
  rsync -abv --delete --backup-dir=$HOME/Pictures/Deleted /media/clemens/Foto3/Pictures/ $HOME/Pictures/Photos/ &>$LOGDIR/${time}_Photos.log

else
  echo "\nOne of the drives is not mounted."
fi
