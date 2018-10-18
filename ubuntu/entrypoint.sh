#!/bin/sh

# start fake X server
nohup Xvfb :6 -screen 0 1280x1024x24 > /X.log 2>&1 &

export DISPLAY=:6

"$@"
