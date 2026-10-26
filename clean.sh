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
     echo -e "${R}ERROR:: $source_dir does not exist${N}"
     exit 1
 fi

echo "scanning files older than $days days in $source_dir"


files_to_delete=$(find "$source_dir" -type f -name "*.log"  -mtime +"$days")

if [ -z "$files_to_delete" ]; then 
    echo "No files found older than $days days to delete"
    exit 0
fi
while IFS= read -r line
do 
echo "files is going to be deleted:$line" 
done <<< "$files_to_delete"





#!/bin/bash

# source_dir=$1
# days=${2:-14}

# R="\e[31m"
# G="\e[32m"
# Y="\e[33m"
# N="\e[0m"

# usage() {
#     echo -e "${R}USAGE:: $0 [source_dir] [days(optional, default to 14 days)]${N}"
#     exit 1
# }

# if [ -z "$source_dir" ]; then
#     echo "ERROR: Missing source directory parameter"
#     usage
# fi

# if [ ! -d "$source_dir" ]; then
#     echo -e "${R}ERROR:: $source_dir does not exist${N}"
#     exit 1
# fi

# echo "Scanning files older than $days days in $source_dir"

# files_to_delete=$(find "$source_dir" -type f -name "*.log" -mtime +"$days")

# if [ -z "$files_to_delete" ]; then
#     echo "No files found older than $days days"
#     exit 0
# fi

# while IFS= read -r line
# do
#     echo "File found: $line"
# done <<< "$files_to_delete"
