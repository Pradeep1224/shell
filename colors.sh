user_id=$(id -u)
logs_folder="/var/logs/shell-practice"
logs_file="${logs_folder}/${0}.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

 if [ $user_id -ne 0 ]; then
    echo "please run with sudo access......."
    exit 1
fi

mkdir -p $logs_folder
echo "Script started at: $(date +"%F %T")"


validate(){
    if [ $1 -ne 0 ]; then
        echo -e "${2} installation ${R}FAILED${N}" | tee -a $logs_file
        exit 1
    else
        echo -e "${2} installation is ${G}SUCCESS${N}" | tee -a $logs_file
    fi
}

for package in $@
do
    dnf list installed $package &>> logs_file
    if [ $? -ne 0 ];  then
    
    echo "going to install : ${package}"
    dnf install $package -y &>> $logs_file
    validate $? "${package}"

    else
     echo -e "${package} Already Installed... ${Y}SKIPP${G}ING${N}"
    fi
done 