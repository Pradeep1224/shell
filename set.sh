#!/bin/bash\
set -e

#echo "start"
#echo "end"
user_id=$(id -u)
logs_folder="/var/logs/shell-practice"
logs_file="${logs_folder}/${0}.log"


 if [ $user_id -ne 0 ]; then
    echo "please run with sudo access......."
    exit 1
fi

mkdir -p $logs_folder
echo "Script started at: $(date +"%F %T")"


trap 'echo "Error at $LINENO", command:"$BASH_COMMAND"' ERR
for package in $@
do
    dnf list installed $package &>> logs_file
    if [ $? -ne 0 ];  then
    
    echo "Going to install : ${package}"
    dnf install $package -y &>> $logs_file
    validate $? "${package}"

    else
     echo "$package Already Installed. SKIPPING"
    fi
done 