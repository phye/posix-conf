#!/bin/bash
SRC_DIR=$1
FILTER_DIR=".VDEROOT/policy"
if [ $(dirname $(pwd)) != "/ws/phye" ]; then
    echo "This script can only be callled within workspace"
    exit 
fi

cp -f $SRC_DIR/$FILTER_DIR/filter* ./$FILTER_DIR

