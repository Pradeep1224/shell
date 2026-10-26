#!/bin/bash
disk_usage=$(df -hT | grep -v Filesystem)
usage_threshold=20
server_ips=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)

while IFS= read -r line 
do 
usage=$(echo $line | awk '{print $6}' | cut -d "%" -f1)
partition=$(echo $line | awk '{print $7}')
if [ "$usage" -ge "$usage_threshold" ]; then
    message+="High disk Usage on $partition:$usage <br>"
fi
done <<< "$disk_usage"
#echo -e "$message"

sh mail.sh "Devops Team" "$server_ips" "High Disk Usage" "$message" "kondaboinapradeep369@gmail.com" "High Disk Usage Alert"