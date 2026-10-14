user_id=$(id -u)

 if [ $user_id -ne 0 ]; then
    echo "please run with sudo access......."
    exit 1
fi
echo "proceeding.."

dnf install nginx -y

if [ $? -ne 0 ]; then
    echo "nginx installation failed"
    exit 1
else
    echo "Nginx installation is sucessful"
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "mysql installation failed"
    exit 1
else
    echo "mysql installation is sucessful"
fi
echo "still proceed"