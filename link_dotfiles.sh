#!/usr/bin/env bash

ls -l1 | grep -Ev "backup" | xargs -I% ln -hs `pwd`/% ~/.%

