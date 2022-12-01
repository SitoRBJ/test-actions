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


if [[ "pull_request" = ${GITHUB_EVENT_NAME} ]]; then
    echo "This is a PR"
    git diff ${GITHUB_BASE_REF} ${GITHUB_HEAD_REF} --dirstat
    echot "THEN"
    TFSEC_DIRS=$(git diff ${GITHUB_BASE_REF} ${GITHUB_HEAD_REF} --dirstat | awk -F '% ' '{print $2}')
    echo $TFSEC_DIRS
else
    echo "This is not a PR"
fi
