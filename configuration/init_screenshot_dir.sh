#!/usr/bin/env bash

DIR=$HOME/Downloads/screenshots

mkdir $DIR
defaults write com.apple.screencapture location $DIR

echo "Screenshots should now save to ${DIR}"
