#!/bin/bash

EMACS_HOME=~/.emacs.d
MODULES_DIR=$EMACS_HOME/git-modules

for module in $(ls $MODULES_DIR); do
    cd $MODULES_DIR/$module
    echo "Start pull in $module"
    git checkout master
    git pull
    # if [[ -f Makefile ]]; then
    #     echo "Compile $module"
    #     make
    # fi
done
