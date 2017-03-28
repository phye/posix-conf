#!/bin/bash
SRC_DIR=$1
echo "Removing old cscope files"
for i in $SRC_DIR/cscope.*; do
    rm -f $i
done

echo "Generating new cscope files"
find . -name '*.js' -o -name '*.py' -o -name '*.sh' -o -name '*.json' -o -name '*.yml' | grep -v venv | grep -v node_modules | grep -v v2p-ui | grep -v npm-cache | grep -v deprecated | grep -v gui> cscope.files

cd $SRC_DIR && pwd 
cscope -b -q 

echo "Done"
