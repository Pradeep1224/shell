user_id=$(id -u)
logs_folder="/var/logs/shell-practice"
logs_file="${logs_folder}/${0}.log"


 if [ $user_id -ne 0 ]; then
    echo "please run with sudo access......."
    exit 1
fi

mkdir -p $logs_folder
echo "Script started at: $(date +"%F %T")"


validate(){
    if [ $1 -ne 0 ]; then
        echo "${2} installation FAILED" | tee -a $logs_file
        exit 1
    else
        echo "${2} installation is SUCCESS" | tee -a $logs_file
    fi
}

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