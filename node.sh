#!/bin/bash
###########
#Author :: Shiva sai
#CreatedDate :: 05-04-2025
#This shell script is written to know the node status
############
set -x #Debug mode
set -e #code execution fails when error occurs
set -o pipefail #pipefail
free -g
nproc
df -h