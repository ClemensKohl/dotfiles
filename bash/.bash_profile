if [ "$JOB_NAME" != "" ]; then
        exit 0
fi

if [ -f ~/.bashrc ];
then 
    .  ~/.bashrc; 
fi 

if [ -f ~/.profile ];
then 
    .  ~/.profile; 
fi

#source ~/.bashrc 
#source ~/.profile 


. "$HOME/.cargo/env"
