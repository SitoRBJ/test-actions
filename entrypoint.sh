#!/bin/sh -l

echo "Hello $1"
time=$(date)
echo "::set-output name=time::$time"

echo "VARS"
echo $GITHUB_EVENT_NAME