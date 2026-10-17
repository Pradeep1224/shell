user_id=$(id -u)

 if [ $user_id -ne 0 ]; then
    echo "please run with sudo access......."
    exit 1
fi
echo "proceeding.."

dnf install nginx -y
variable(){
    if [ $1 -ne 0 ]; then
        echo "${2}| installation failed"
        exit 1
    else
        echo "${2} installation is sucessful"
    fi
}
variable "$?" "nginix" 
dnf install mysql -y
variable "$?" "mysql"

echo "done successful"