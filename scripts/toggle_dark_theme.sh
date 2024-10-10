#!/bin/bash

if [[ "$LOCATION" == "office" ]]; then
    if [[ "$OSTYPE" == "darwin"* ]]; then
        /usr/bin/osascript -e "tell app \"System Events\" to tell appearance preferences to set dark mode to $1"
    fi
fi