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

STARTWORKSEC=`echo "06:00:00" | awk -F: '{ print ($1 * 3600) + ($2 * 60) + $3 }'`
ENDWORKSEC=`echo "16:00:00" | awk -F: '{ print ($1 * 3600) + ($2 * 60) + $3 }'`

#DATE=`date +"%Y-%m-%d"`
DATE="2017-05-09"
#MDATE=`date +"%m-%Y"`
MDATE="05-2017"

for i in $(seq 406 415); do
	cd $TGMSAHOME
	if [ ! -d $REPORTSHOME ]; then
                mkdir $REPORTSHOME
    fi

	if [ ! -d $TGMSAHOME/reports/$DATE ]; then
		mkdir $TGMSAHOME/reports/$DATE
	fi

	if [ ! -d $TGMSAHOME/reports/$MDATE ]; then
		mkdir $TGMSAHOME/reports/$MDATE
	fi

	bash $TGMSAHOME/dbData.sh $i | grep -v czas| grep $DATE | awk 'NR==1; END{print}'| sed "s/$DATE//g"|cut -d " " -f4|tr '\n' ',' > $TGMSAHOME/reports/$DATE/report-$DATE-temp.csv

# get open hours from Db
	OPENHOUR=`bash $TGMSAHOME/dbData.sh $i | grep -v czas| grep $DATE | awk 'NR==1; END{print}'| sed "s/$DATE//g"|cut -d " " -f4|tr '\n' ','|cut -d "," -f1`
	OPENHOURSEC=`echo $OPENHOUR | awk -F: '{ print ($1 * 3600) + ($2 * 60) + $3 }'`

	if [ $OPENHOURSEC -le $STARTWORKSEC ]; then
		OPENHOURSEC=$STARTWORKSEC
#	elif [ $OPENHOUR =~ ^[0-9][0-9]:[0-9][0-9]:[0-9][0-9]$ ]; then
#		OPENHOURSEC=0
#		echo z warunku $OPENHOURSEC
	fi
#	echo orig open /$OPENHOUR/
#	echo new open $STARTWORKSEC

	CLOSEHOUR=`bash $TGMSAHOME/dbData.sh $i | grep -v czas| grep $DATE | awk 'NR==1; END{print}'| sed "s/$DATE//g"|cut -d " " -f4|tr '\n' ','|cut -d "," -f2`
	CLOSEHOURSEC=`echo $CLOSEHOUR | awk -F: '{ print ($1 * 3600) + ($2 * 60) + $3 }'`

	if [ $CLOSEHOURSEC -ge $ENDWORKSEC ]; then
		CLOSEHOURSEC=$ENDWORKSEC
	fi

#	echo orig close $CLOSEHOUR
#        echo new close $ENDWORKSEC

	TIMEOPENSEC=`expr $CLOSEHOURSEC - $OPENHOURSEC`
	TIMEOPEN=`date -d @$TIMEOPENSEC +%H:%M:%S`
	echo ------ czas otwarcia: $TIMEOPEN ------

########DEBUG MESSAGES#################
#	echo open $OPENHOUR
#	echo opensec $OPENHOURSEC
#	echo close $CLOSEHOUR
#	echo closesec $CLOSEHOURSEC
#	echo timeopensec $TIMEOPENSEC
#	echo timeopen $TIMEOPEN
#######################################

	BOXNAME=`mysql accoDb -e "select nazwaUzytkownika from Zdarzenie where (idUzytkownik = $i)"|sort -u|grep -v nazwaUzytkownika`
	echo $BOXNAME,$TIMEOPEN >> $TGMSAHOME/reports/$DATE/report-$DATE-temp.csv




	#############Generate data for monthly report##########################


	if [ ! -f $TGMSAHOME/reports/$MDATE/BOX-$i.csv ]; then
			TMP22=$TIMEOPENSEC
	fi

	TMP=`cat $TGMSAHOME/reports/$MDATE/BOX-$i.csv`

	TMP2=$((TMP+$TIMEOPENSEC))

	echo "tymczasowy: ${TMP} ${TMP2}"
	echo "tymczasowy2: ${TIMEOPEN}"

	echo $TMP2 > $TGMSAHOME/reports/$MDATE/BOX-$i.csv

	TIMEOPENMONTH=`date -d @$echo $TMP2 +%H:%M:%S`
	echo "w godzinach $TIMEOPENMONTH"




	############# End Generate data for monthly report ##########################




	cat $TGMSAHOME/reports/$DATE/report-$DATE-temp.csv >> $TGMSAHOME/reports/$DATE/report-$DATE.csv
	rm -r $TGMSAHOME/reports/$DATE/report-$DATE-temp.csv
done

sed -i "s/:/./g" $REPORTSHOME/$DATE/report-$DATE.csv
cp html-template/report-template.html $REPORTSHOME/$DATE/report-$DATE.html
sed -i "s/INSERT-DATE/$DATE/g" $REPORTSHOME/$DATE/report-$DATE.html
