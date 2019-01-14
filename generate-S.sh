#/bin/bash

#TGMSAHOME=`pwd`
TGMSAHOME='/home/michal/tgmsa'
REPORTSHOME=$TGMSAHOME/reports

#DATE=`date +"%Y-%m-%d"`
DATE="2018-04-20"

#REPORTDATE=`date +"%d-%m-%Y"`
REPORTDATE="20-04-2018"

#MDATE=`date +"%Y-%m"`
MDATE="2018-04"

#MREPORTDATE=`date +"%m-%Y"`
MREPORTDATE="04-2018"

#YDATE=`date +"%Y"`
YDATE="2018"

###################################################
#Spozywka

for i in 128 130; do
#for i in $(seq 200 201); do
	cd $TGMSAHOME
	if [ ! -d $REPORTSHOME ]; then
        mkdir $REPORTSHOME
        echo test
    fi

    if [ ! -d $TGMSAHOME/reports/${YDATE}S ]; then
        mkdir $TGMSAHOME/reports/${YDATE}S
        echo test2
    fi

	if [ ! -d $TGMSAHOME/reports/${YDATE}S/$DATE ]; then
		mkdir $TGMSAHOME/reports/${YDATE}S/$DATE
	fi

	if [ ! -d $TGMSAHOME/reports/${YDATE}S/$MDATE ]; then
		mkdir $TGMSAHOME/reports/${YDATE}S/$MDATE
	fi

	if [ ! -d $TGMSAHOME/reports/${YDATE}S/$MDATE/BOX-$i ]; then
		mkdir $TGMSAHOME/reports/${YDATE}S/$MDATE/BOX-$i
	fi	

	if [ ! -d $TGMSAHOME/reports/${YDATE}S/$MDATE/BOX-$i/DAILY ]; then
		mkdir $TGMSAHOME/reports/${YDATE}S/$MDATE/BOX-$i/DAILY
	fi

	if [ ! -f $TGMSAHOME/reports/${YDATE}S/$MDATE/BOX-$i/DAILY/report-$MDATE.csv ]; then
		touch $TGMSAHOME/reports/${YDATE}S/$MDATE/BOX-$i/DAILY/report-$MDATE.csv
	fi

python $TGMSAHOME/main-S.py $i $DATE

TIMEOPEN=`cat $TGMSAHOME/reports/${YDATE}S/$DATE/report-$DATE.csv|grep -i BOX-$i |cut -d ";" -f4`
echo "otwarcie w godzinach $TIMEOPEN"


###########tu poprawic . na :


TIMEOPENDOT=`echo $TIMEOPEN| cut -d ',' -f 4`
TIMEOPENDOTSEC=`echo ${TIMEOPENDOT/./:}`
TIMEOPENSEC=`echo $TIMEOPENDOTSEC | awk -F: '{ print ($1 * 3600) + ($2 * 60) }'`
#TIMEOPENSEC=`echo $TIMEOPEN | cut -d ',' -f4 | awk -F: '{ print ($1 * 3600) + ($2 * 60) + $3 }'`
echo "otwarcie w sekundach $TIMEOPENSEC"

#echo $i,$TIMEOPEN >> $TGMSAHOME/reports/${YDATE}S/$DATE/report-$DATE-temp.csv

#for monthly report
#sprawdzenie czy juz jest plik w tym miesiacu, jezeli nie to bedzie 0  idziemy dalej, generowane jest tylko pierwszego dnia miesiaca
PREVIOUSTIMEOPEN=`cat $TGMSAHOME/reports/${YDATE}S/$MDATE/BOX-$i/BOX-$i.csv`
echo "wczesniejsze otwarcie: $PREVIOUSTIMEOPEN"
CURRENTTIMEOPEN=$(($PREVIOUSTIMEOPEN+$TIMEOPENSEC))
echo $CURRENTTIMEOPEN > $TGMSAHOME/reports/${YDATE}S/$MDATE/BOX-$i/BOX-$i.csv
echo "otwarcie: $CURRENTTIMEOPEN"

# HOUROPEN=`expr $CURRENTTIMEOPEN / 60`
# MINUTEOPEN=`expr $CURRENTTIMEOPEN % 60`
# echo "w godzinach i minutach: $HOUROPEN:$MINUTEOPEN"
TIMEOPENHOUR=`expr $CURRENTTIMEOPEN / 60`
#TIMEOPENHOUR=
echo "w minutach: $TIMEOPENHOUR"
echo "w godzinach: $(($TIMEOPENHOUR / 60)):$(($TIMEOPENHOUR % 60))"
echo "BOX-$i,$(($TIMEOPENHOUR / 60)):$(($TIMEOPENHOUR % 60))" > $TGMSAHOME/reports/${YDATE}S/$MDATE/$MDATE-BOX-$i.csv

#monthly detailed report
cp html-template/report-detailed-template.html $REPORTSHOME/${YDATE}S/$MDATE/BOX-$i/DAILY/report-$MDATE.html
sed -i "s/INSERT-MONTHLY-DATE/$MDATE/g" $REPORTSHOME/${YDATE}S/$MDATE/BOX-$i/DAILY/report-$MDATE.html
sed -i "s/INSERT-BOX-NUMBER/$i/g" $REPORTSHOME/${YDATE}S/$MDATE/BOX-$i/DAILY/report-$MDATE.html
sed -i "s/:/./g" $REPORTSHOME/${YDATE}S/$MDATE/BOX-$i/DAILY/report-$MDATE.csv
#end monthly detailed report


######################

done

#daily report
cp html-template/report-template.html $REPORTSHOME/${YDATE}S/$DATE/report-$DATE.html
sed -i "s/INSERT-DATE/$DATE/g" $TGMSAHOME/reports/${YDATE}S/$DATE/report-$DATE.html
sed -i "s/:/./g" $TGMSAHOME/reports/${YDATE}S/$DATE/report-$DATE.csv
sed -i "s/;/,/g" $TGMSAHOME/reports/${YDATE}S/$DATE/report-$DATE.csv
#end daily report

#monthly report
cp html-template/monthly-all-box-template.html $REPORTSHOME/${YDATE}S/$MDATE/$MDATE.html
sed -i "s/INSERT-MONTHLY-DATE/$MDATE/g" $REPORTSHOME/${YDATE}S/$MDATE/$MDATE.html
cat $TGMSAHOME/reports/${YDATE}S/$MDATE/$MDATE-BOX-*.csv > $TGMSAHOME/reports/${YDATE}S/$MDATE/all-data.csv
sed -i "s/:/./g" $TGMSAHOME/reports/${YDATE}S/$MDATE/all-data.csv
#end montrly report

#replace in main index.html
sed -i "/INSERT HERE S-DAILY/a <option VALUE='https://tgmsa.vipkam.pl/${YDATE}S/$DATE/report-$DATE.html'>$REPORTDATE</option>" $TGMSAHOME/reports/index.html

grep -rH "https://tgmsa.vipkam.pl/${YDATE}S/$MDATE/$MDATE.html" $TGMSAHOME/reports/index.html
if [ $? -eq 1 ]; then
	sed -i "/INSERT HERE S-MONTHLY/a <option VALUE='https://tgmsa.vipkam.pl/${YDATE}S/$MDATE/$MDATE.html'>$MREPORTDATE</option>" $TGMSAHOME/reports/index.html
fi