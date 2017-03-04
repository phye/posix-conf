#!/bin/bash
mkdir -p $HOME
echo "Copying all config files to $HOME"
/bin/cp -f .[a-z]* $HOME 2>/dev/null
/bin/cp -r .vim $HOME 2>/dev/null

mkdir -p $HOME/bin/
/bin/cp -r phye $HOME/bin/ 2>/dev/null
/bin/cp -r sanity $HOME/bin/ 2>/dev/null

cat ssh_config >> ~/.ssh/config

echo "Appending .bashrc to include configs for phye"
BASHRC_FILE=$HOME/.bashrc
#touch $BASHRC_FILE
grep "bashrc_phye" $BASHRC_FILE >> /dev/null
if [ $? != 0 ]; then
    echo '[ -f ~/.bashrc_phye ] && . ~/.bashrc_phye ' >> $BASHRC_FILE 
else
    echo "Phye's config is already in .bashrc, no need to append"
fi

echo "Sourcing modified .bashrc_phye"
echo ""
source $BASHRC_FILE
