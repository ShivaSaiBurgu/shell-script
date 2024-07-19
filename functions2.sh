USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0) | grep -d "."  -f1
LOGFILE=tmp/$SCRIPT_NAME/$TIMESTAMP.log