 #!/bin/bash
source_dir=$1
dest_dir=$2
days=${3:-14}
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
usage(){
    echo -e "${R}USAGE:: $0 [source_dir] [dest_dir]  [days(optional, default to 14 days)]${N}"
    exit 1
}

if [ -z "$source_dir" ] || [ -z "$dest_dir" ]; then
   echo "Either source or destination directory are missing"
   usage 

fi

if [ ! -d "$source_dir" ]; then 
 echo "$source_dir doesnt exist"
 exit 1
fi

if [ ! -d "$dest_dir" ]; then 
 echo "$dest_dir doesnt exist"
 exit 1
fi


