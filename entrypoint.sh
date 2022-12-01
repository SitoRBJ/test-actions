#!/bin/sh -l

echo "Hello $1"
time=$(date)
echo "::set-output name=time::$time"

echo "GITHUB_EVENT_NAME"
echo $GITHUB_EVENT_NAME
echo "GITHUB_REF_TYPE"
echo $GITHUB_REF_TYPE
echo "GITHUB_REF_NAME"
echo $GITHUB_REF_NAME
echo "GITHUB_BASE_REF"
echo $GITHUB_BASE_REF
echo "GITHUB_REF"
echo $GITHUB_REF
echo "GITHUB_HEAD_REF"
echo $GITHUB_HEAD_REF


if [[ ${GITHUB_EVENT_NAME} == *"pull_request"* ]]; then
    echo "This is a PR"
else
    echo "This is not a PR"
fi
