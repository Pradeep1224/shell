#1/bin/bash

to_team=$1
server_ip=$2
alert_type=$3
message=$4
to_address=$5
subject=$6
final_message=$(echo "$message" | sed 's/[.|$*^\\\/]/\\&/g')
final_body=$(sed -e "s/to_team/g" -e "s/slert_type/$alert_type/g" \
-e "s/SERVER_IP/$server_ips/g" -e "message_body/$final_message/g" \
 template.html)

{
echo "To: $to_address"
echo "Subject: $subject"
echo "Content-Type: text/html"
echo ""
echo "test content"
} | msmtp "$to_address"
