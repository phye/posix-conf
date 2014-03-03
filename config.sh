#!/bin/bash
mkdir -p $HOME
echo "Copying all config files to $HOME"
cp .[a-z]* $HOME 2>/dev/null
cp -r .vim $HOME 2>/dev/null

echo "Appending .bashrc to include configs for phye"
BASHRC_FILE=$HOME/.bashrc
touch $BASHRC_FILE
grep "bashrc_phye" $BASHRC_FILE
if [ $? != 0 ]; then
    echo 'if [ -f $HOME/.bashrc_phye ]; then' >> $BASHRC_FILE 
    echo '    source $HOME/.bashrc_phye' >> $BASHRC_FILE
    echo 'fi' >> $BASHRC_FILE
fi

echo "Sourcing modified .bashrc_phye"
source $BASHRC_FILE
