#!/bin/bash
source_dir=$1
days=${2:-14}
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
usage(){
    echo -e "${R}USAGE:: $0 [source_dir] [days(optional, default to 14 days)]${N}"
    exit 1
}



if [ -z "$source_dir" ]; then
    echo "ERROR:missing source directory parameter"

    usage       
fi 

if [ ! -d "$source_dir" ]; then 

    echo -e "ERROR : no such directory, $source_dir doesnot exists" 

fi

echo "scanning files older than $days in $source_dir"
files_to_delete=$(find $source_dir -name "*.log" -type f -mtime $days)

if [ -z "$file_to_delete"]; then 
    echo "No files found older than $days to delete"
    exit 0
fi
while IFS= read -r line
do 
echo "files is going to be deleted:$line" 
done <<< "$files_to_delete"