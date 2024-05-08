#!/bin/bash
SRC_DIR=$1
echo "Removing old cscope files"
for i in $SRC_DIR/cscope.*; do
    rm -f $i
done

echo "Generating new cscope files"
find $SRC_DIR -name "*.h" -o -name "*.c" -o -name "*.cpp" -o -name "*.hpp" > $SRC_DIR/cscope.files
cd $SRC_DIR && pwd
cscope -b -q

echo "Done"
