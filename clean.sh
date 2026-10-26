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

    echo "ERROR : no such directory, $sourc_dir doesnot exists"