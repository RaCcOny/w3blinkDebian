#!/bin/bash

#Get private ip 
#/sbin/ifconfig eth1 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}'

#Get external ip
#lynx --dump http://ipecho.net/plain | awk '{print $1}'

#Get MySQL Info
#Version
#service mysql status | grep Server | awk '{print $3}'
#Uptime
#service mysql status | grep Uptime | awk '{print $2,$3,$4,$5,$6,$7,$8,$9}'




#Get PHP Data
#Version 
#php -i | grep "PHP Version" | awk 'FNR == 1 {print $4}'
#Registered Streams
#php -i | grep "Registered PHP Streams" | awk '{print $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17}'



#uptime




#Executar funcionalidades
case "$1" in
	Start)  
		echo "Olá" > report.mail
		echo "O seu servidor acabou de se ligar com a seguinte informação de rede:" >> report.mail
		echo "IP externo:" >> report.mail
		curl icanhazip.com >> report.mail
		echo "IP Interno:" >> report.mail 
		/sbin/ifconfig eth1 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}' >> report.mail	
		echo "" >> report.mail
		echo "Informações do seu disco:" >> report.mail
		df -h >> report.mail
		echo "" >> report.mail
		mail -s "w3blink - O seu servidor acabou de se ligar!" NotificationEmailGoesHerem < report.mail
	    ;;
	Shutdown) 
		mail -s "Teste" NotificationEmailGoesHere < report.mail
	    ;;
esac
