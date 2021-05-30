#!/bin/bash

echo "stop instance"
(! pidof masters-of-conquest-headless) || sudo kill -9 $(pidof masters-of-conquest-headless)
