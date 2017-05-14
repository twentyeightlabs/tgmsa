#/bin/bash

TGMSAHOME=/root/tgmsa
REPORTSHOME=$TGMSAHOME/reports
BOXES=395
OPENHOUR
CLOSEHOUR
OPENHOURSEC
CLOSEHOURSEC
TIMEOPEN
TIMEOPENSEC

STARTTIMESEC=28800
ENDTIMESEC=64800

#DATE=`date +"%Y-%m-%d"`
DATE="2017-05-08"

for i in $(seq 406 415); do
	cd $TGMSAHOME
	if [ ! -d $REPORTSHOME ]; then
                mkdir $REPORTSHOME
        fi

	if [ ! -d $TGMSAHOME/reports/$DATE ]; then
		mkdir $TGMSAHOME/reports/$DATE
	fi
	bash $TGMSAHOME/dbData.sh $i | grep -v czas| grep $DATE | awk 'NR==1; END{print}'| sed "s/$DATE//g"|cut -d " " -f4|tr '\n' ',' >> $TGMSAHOME/reports/$DATE/report-$DATE.csv

# get open hours from Db
	OPENHOUR=`bash $TGMSAHOME/dbData.sh $i | grep -v czas| grep $DATE | awk 'NR==1; END{print}'| sed "s/$DATE//g"|cut -d " " -f4|tr '\n' ','|cut -d "," -f1`
	OPENHOURSEC=`echo $OPENHOUR | awk -F: '{ print ($1 * 3600) + ($2 * 60) + $3 }'`
	CLOSEHOUR=`bash $TGMSAHOME/dbData.sh $i | grep -v czas| grep $DATE | awk 'NR==1; END{print}'| sed "s/$DATE//g"|cut -d " " -f4|tr '\n' ','|cut -d "," -f2`
	CLOSEHOURSEC=`echo $CLOSEHOUR | awk -F: '{ print ($1 * 3600) + ($2 * 60) + $3 }'`
	TIMEOPENSEC=`expr $CLOSEHOURSEC - $OPENHOURSEC`
	TIMEOPEN=`date -d @$TIMEOPENSEC +%H:%M:%S`

########DEBUG MESSAGES#################
#	echo open $OPENHOUR
#	echo opensec $OPENHOURSEC
#	echo close $CLOSEHOUR
#	echo closesec $CLOSEHOURSEC
#	echo timeopensec $TIMEOPENSEC
#	echo timeopen $TIMEOPEN
#######################################

	BOXNAME=`mysql accoDb -e "select nazwaUzytkownika from Zdarzenie where (idUzytkownik = $i)"|sort -u|grep -v nazwaUzytkownika`
	echo $BOXNAME,$TIMEOPEN >> $TGMSAHOME/reports/$DATE/report-$DATE.csv
done

sed -i "s/:/./g" $REPORTSHOME/$DATE/report-$DATE.csv
