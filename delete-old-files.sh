#!/bin/bash
set -e
trap 'echo "error at line ${LINENO}"' ERR
echo "Process id of current shell script is $$"
echo "Iam learning DevOps with AWS cloud"
SOURCE_DIRECTORY=/tmp/app.logs
find . -name "*.log" -mtime +14