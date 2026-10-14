user_id=$(id -u)

 if [ $user_id -ne 0 ]; then
    echo "please run with sudo access......."
fi

dnf install nginx -y