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
DATE="2017-05-10"
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

	if [ ! -d $TGMSAHOME/reports/$MDATE/BOX-$i ]; then
		mkdir $TGMSAHOME/reports/$MDATE/BOX-$i
	fi	

	if [ ! -d $TGMSAHOME/reports/$MDATE/BOX-$i/DAILY ]; then
		mkdir $TGMSAHOME/reports/$MDATE/BOX-$i/DAILY
	fi	

	#bash $TGMSAHOME/dbData.sh $i | grep -v czas| grep $DATE | awk 'NR==1; END{print}'| sed "s/$DATE//g"|cut -d " " -f4|tr '\n' ',' > $TGMSAHOME/reports/$DATE/report-$DATE-temp.csv

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
	echo "tesssstuuuujemy: $OPENHOURSEC"

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
	sed -i "s/18.00.00/0/g" $TGMSAHOME/reports/$DATE/report-$DATE-temp.csv




	#############Generate data for monthly report##########################


	if [ ! -f $TGMSAHOME/reports/$MDATE/BOX-$i/BOX-$i.csv ]; then
					TMP22=$TIMEOPENSEC
	fi

	TMP=`cat $TGMSAHOME/reports/$MDATE/BOX-$i/BOX-$i.csv`
	echo "test tyczasoweeeegooooo: $TMP"
	#if [ "$TMP" -le 0 ]; then
	#	TMP=0
	#fi

	echo "test po ustawieniu tymczasowego: $TMP"

	TMP2=$((TMP+$TIMEOPENSEC))
	
	echo "test po ustawieniu tymczasowego: $TMP2"

	if [ "$TMP2" -lt 0 ]; then
               echo "correct"
		echo "wyzeruj:"
		TMP2=0
		echo "po zerowaniu: $TMP2"
        fi

	echo "test po ustawieniu tymczasowego2222: $TMP2"
	
	echo "tymczasowy: ${TMP} ${TMP2}"
	echo "tymczasowy2: ${TIMEOPEN}"

	echo $TMP2 > $TGMSAHOME/reports/$MDATE/BOX-$i/BOX-$i.csv

	TIMEOPENMONTH=`expr $TMP2 / 60`
	#TIMEOPENH=`expr $TIMEOPENMONTHN / 60`
	echo "w godzinach ${TIMEOPENMONTH}"
	echo "w godzinach2 ${TIMEOPENH} $(($TIMEOPENMONTH / 60)) $(($TIMEOPENMONTH % 60))"
	echo "$(($TIMEOPENMONTH / 60)).$(($TIMEOPENMONTH % 60))"  > $TGMSAHOME/reports/$MDATE/BOX-$i/BOX-$i-H.csv
	echo "BOX-$i,$(($TIMEOPENMONTH / 60)).$(($TIMEOPENMONTH % 60))"  > $TGMSAHOME/reports/$MDATE/$MDATE-BOX-$i.csv
	# echo "$DATE,$(($TIMEOPENMONTH / 60)).$(($TIMEOPENMONTH % 60))"  >> $TGMSAHOME/reports/$MDATE/BOX-$i/DAILY/BOX-$i-DAILY.csv
	echo "$DATE,$TIMEOPEN" >> $TGMSAHOME/reports/$MDATE/BOX-$i/DAILY/BOX-$i-DAILY.csv
	sed -i "s/:/./g" $TGMSAHOME/reports/$MDATE/BOX-$i/DAILY/BOX-$i-DAILY.csv
	cp html-template/report-template-monthly.html $REPORTSHOME/$MDATE/BOX-$i/BOX-$i-H.html
	sed -i "s/INSERT-MONTHLY-DATE/$MDATE/g" $REPORTSHOME/$MDATE/BOX-$i/BOX-$i-H.html
	sed -i "s/INSERT-BOX-NUMBER/$i/g" $REPORTSHOME/$MDATE/BOX-$i/BOX-$i-H.html

	cp html-template/report-detailed-template.html $TGMSAHOME/reports/$MDATE/BOX-$i/DAILY/daily-details.html
	sed -i "s/INSERT-MONTHLY-DATE/$MDATE/g" $TGMSAHOME/reports/$MDATE/BOX-$i/DAILY/daily-details.html
	sed -i "s/INSERT-BOX-NUMBER/$i/g" $TGMSAHOME/reports/$MDATE/BOX-$i/DAILY/daily-details.html



	############# End Generate data for monthly report ##########################




	cat $TGMSAHOME/reports/$DATE/report-$DATE-temp.csv >> $TGMSAHOME/reports/$DATE/report-$DATE.csv
	rm -r $TGMSAHOME/reports/$DATE/report-$DATE-temp.csv
done

sed -i "s/:/./g" $REPORTSHOME/$DATE/report-$DATE.csv

cp html-template/report-template.html $REPORTSHOME/$DATE/report-$DATE.html
sed -i "s/INSERT-DATE/$DATE/g" $REPORTSHOME/$DATE/report-$DATE.html

cp html-template/monthly-all-box-template.html $REPORTSHOME/$MDATE/$MDATE.html
sed -i "s/INSERT-MONTHLY-DATE/$MDATE/g" $REPORTSHOME/$MDATE/$MDATE.html

rm -rf $TGMSAHOME/reports/$MDATE/all-data.csv
cat $TGMSAHOME/reports/$MDATE/$MDATE-BOX-*.csv > $TGMSAHOME/reports/$MDATE/all-data.csv
