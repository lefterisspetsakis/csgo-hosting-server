#!/bin/sh 
while [ true ]
do
	date +"%m/%d/%Y %H:%M:%S $HOSTNAME"
	echo "sending email..."
	wget -q -O - checkip.dyndns.org|sed -e 's/.*Current IP Address: //' -e 's/<.*$//' > ~/myip
	date +"%m/%d/%Y %H:%M:%S $HOSTNAME"
	echo "sent"
	ssmtp left.plan@gmail.com < myip
	ssmtp nimrodvanir97@gmail.com < myip
	sleep 3600
done
