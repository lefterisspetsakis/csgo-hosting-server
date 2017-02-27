#!/bin/sh 

FILENAME="myip"
IP="error"

echo $IP
echo "$IP"

while [ true ]
do
	#check if the file exists
	if test -e "$FILENAME";then
		#get ip
		IP="`wget -q -O - checkip.dyndns.org|sed -e 's/.*Current IP Address: //' -e 's/<.*$//'`"
		#if ip is different from stored ip, send email
		if [ "$IP" != "$FILENAME" ]
			echo "sending email..."
			date +"%m/%d/%Y %H:%M:%S $HOSTNAME"
			echo "$IP"
			echo "$IP" > "$FILENAME"
			ssmtp left.plan@gmail.com < myip
			ssmtp nimrodvanir97@gmail.com < myip
		fi
	#if myip file doesnt exist, create one
	#TODO: wrap email code in a function and call it every time there is a change in the ip
	else;then
		wget -q -O - checkip.dyndns.org|sed -e 's/.*Current IP Address: //' -e 's/<.*$//' > ~/myip
	fi
	
	#date +"%m/%d/%Y %H:%M:%S $HOSTNAME"
	#echo "sending email..."
	#date +"%m/%d/%Y %H:%M:%S $HOSTNAME"
	#echo "sent"
	#ssmtp left.plan@gmail.com < myip
	#ssmtp nimrodvanir97@gmail.com < myip

	#TODO: test sleep time with 30 seconds (so that this script
	#	checks for an ip change every 30 seconds and notifies
	#	as necessary)
	sleep 1
done
