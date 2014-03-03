#!/bin/bash
source $HOME/.bashrc

INITPATH=$1
function checkin()
{
    vtsi $1/**
    for i in $1/*;do
	if [ -d $i ]; then
	    checkin $i
	fi
    done
}

checkin $INITPATH
