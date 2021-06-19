#!/bin/bash

echo "stop instance"
#(! pidof masters-of-conquest-headless.x86_64) || sudo kill -9 $(pidof masters-of-conquest-headless.x86_64)

# supervisorctl stop game
# killall node
killall masters-of-conquest-headless.x86_64
# supervisorctl start game