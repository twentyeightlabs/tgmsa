#/bin/bash

TGMSAHOME=/root/tgmsa
BOXES=395
OPENHOUR
CLOSEHOUR
OPENHOURSEC
CLOSEHOURSEC
TIMEOPEN
TIMEOPENSEC

#DATE=`date +"%Y-%m-%d"`
DATE="2017-04-01"

for i in $(seq 393 395); do
	cd $TGMSAHOME
	if [ ! -d $TGMSAHOME/$DATE ]; then
		mkdir $TGMSAHOME/$DATE
	fi
	bash $TGMSAHOME/dbData.sh $i | grep -v czas| grep $DATE | awk 'NR==1; END{print}'| sed "s/$DATE//g"|cut -d " " -f4|tr '\n' ',' >> $TGMSAHOME/$DATE/report-$DATE.csv

# get open hours from Db
	OPENHOUR=`bash $TGMSAHOME/dbData.sh $i | grep -v czas| grep $DATE | awk 'NR==1; END{print}'| sed "s/$DATE//g"|cut -d " " -f4|tr '\n' ','|cut -d "," -f1` &>/dev/null
	OPENHOURSEC=`echo $OPENHOUR | awk -F: '{ print ($1 * 3600) + ($2 * 60) + $3 }'` > /dev/null 2>&1
	CLOSEHOUR=`bash $TGMSAHOME/dbData.sh $i | grep -v czas| grep $DATE | awk 'NR==1; END{print}'| sed "s/$DATE//g"|cut -d " " -f4|tr '\n' ','|cut -d "," -f2` > /dev/null 2>&1
	CLOSEHOURSEC=`echo $CLOSEHOUR | awk -F: '{ print ($1 * 3600) + ($2 * 60) + $3 }'` > /dev/null 2>&1
	TIMEOPENSEC=`expr $CLOSEHOURSEC - $OPENHOURSEC` > /dev/null 2>&1
	TIMEOPEN=`date -d @$TIMEOPENSEC +%H:%M:%S` > /dev/null 2>&1

########DEBUG MESSAGES#################
#	echo open $OPENHOUR
#	echo opensec $OPENHOURSEC
#	echo close $CLOSEHOUR
#	echo closesec $CLOSEHOURSEC
#	echo timeopensec $TIMEOPENSEC
#	echo timeopen $TIMEOPEN
#######################################

	BOXNAME=`mysql accoDb -e "select nazwaUzytkownika from Zdarzenie where (idUzytkownik = $i)"|sort -u|grep -v nazwaUzytkownika`
	echo $BOXNAME,$TIMEOPEN >> $TGMSAHOME/$DATE/report-$DATE.csv
done
