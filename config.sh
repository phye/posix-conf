#!/bin/bash
mkdir -p $HOME
echo "Copying all config files to $HOME"
cp .[a-z]* $HOME 2>/dev/null
cp -r .vim $HOME 2>/dev/null

echo "Appending .bashrc to include configs for phye"
BASHRC_FILE=$HOME/.bashrc
touch $BASHRC_FILE
grep "bashrc_phye" $BASHRC_FILE >> /dev/null
if [ $? != 0 ]; then
    echo 'if [ -f $HOME/.bashrc_phye ]; then' >> $BASHRC_FILE 
    echo '    source $HOME/.bashrc_phye' >> $BASHRC_FILE
    echo 'fi' >> $BASHRC_FILE
else
    echo "Phye's config is already in .bashrc, no need to append"
fi

echo "Sourcing modified .bashrc_phye"
echo ""
source $BASHRC_FILE
