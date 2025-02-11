#!/bin/bash
echo "The Entered variables are $@"
echo "The number of variables are:$#"
echo "The name of script name is:$0"
echo "The current working directory is:$PWD"
echo "The home directory of current user is:$HOME"
echo "The name of the user running the script is:$USER"
echo "Hostname:$HOSTNAME"
echo "Process ID of the current shell script: $$"
sleep 60 &
echo "Process ID of last background command: $!"