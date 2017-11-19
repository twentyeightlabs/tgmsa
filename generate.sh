#/bin/bash

#TGMSAHOME=`pwd`
TGMSAHOME='/Users/stachu/work/tgmsa-reports/'
REPORTSHOME=$TGMSAHOME/reports

#DATE=`date +"%Y-%m-%d"`
DATE="2017-11-03"
#REPORTDATE=`date +"%d-%m-%Y"`
REPORTDATE="03-11-2017"
#MDATE=`date +"%Y-%m"`
MDATE="2017-11"
#MREPORTDATE=`date +"%m-%Y"`
MREPORTDATE="11-2017"
#YDATE=`date +"%Y"`
YDATE="2017"



echo $TGMSAHOME
for i in 8 22 28 30 200 217 219; do
#for i in $(seq 200 201); do
	cd $TGMSAHOME
	if [ ! -d $REPORTSHOME ]; then
        mkdir $REPORTSHOME
        echo test
    fi

    if [ ! -d $TGMSAHOME/reports/$YDATE ]; then
        mkdir $TGMSAHOME/reports/$YDATE
        echo test2
    fi

	if [ ! -d $TGMSAHOME/reports/$YDATE/$DATE ]; then
		mkdir $TGMSAHOME/reports/$YDATE/$DATE
	fi

	if [ ! -d $TGMSAHOME/reports/$YDATE/$MDATE ]; then
		mkdir $TGMSAHOME/reports/$YDATE/$MDATE
	fi

	if [ ! -d $TGMSAHOME/reports/$YDATE/$MDATE/BOX-$i ]; then
		mkdir $TGMSAHOME/reports/$YDATE/$MDATE/BOX-$i
	fi	

	if [ ! -d $TGMSAHOME/reports/$YDATE/$MDATE/BOX-$i/DAILY ]; then
		mkdir $TGMSAHOME/reports/$YDATE/$MDATE/BOX-$i/DAILY
	fi

python $TGMSAHOME/main.py $i $DATE

TIMEOPEN=`cat $TGMSAHOME/reports/$YDATE/$DATE/report-$DATE.csv|grep -i BOX-$i |cut -d ";" -f4`
echo "otwarcie w godzinach $TIMEOPEN"
TIMEOPENSEC=`echo $TIMEOPEN | awk -F: '{ print ($1 * 3600) + ($2 * 60) + $3 }'`
echo "otwarcie w sekundach $TIMEOPENSEC"

#echo $i,$TIMEOPEN >> $TGMSAHOME/reports/$YDATE/$DATE/report-$DATE-temp.csv

#for monthly report
#sprawdzenie czy juz jest plik w tym miesiacu, jezeli nie to bedzie 0  idziemy dalej, generowane jest tylko pierwszego dnia miesiaca
PREVIOUSTIMEOPEN=`cat $TGMSAHOME/reports/$YDATE/$MDATE/BOX-$i/BOX-$i.csv`
CURRENTTIMEOPEN=$((PREVIOUSTIMEOPEN+$TIMEOPENSEC))
echo $CURRENTTIMEOPEN > $TGMSAHOME/reports/$YDATE/$MDATE/BOX-$i/BOX-$i.csv
echo "otwarcie: $CURRENTTIMEOPEN"
TIMEOPENHOUR=`expr $CURRENTTIMEOPEN / 60`
echo "w minutach: $TIMEOPENHOUR"
echo "w godzinach: $(($TIMEOPENHOUR / 60)):$(($TIMEOPENHOUR % 60))"
echo "BOX-$i,$(($TIMEOPENHOUR / 60)):$(($TIMEOPENHOUR % 60))" > $TGMSAHOME/reports/$YDATE/$MDATE/$MDATE-BOX-$i.csv

######################

done

#daily report
cp html-template/report-template.html $REPORTSHOME/$YDATE/$DATE/report-$DATE.html
sed -i "s/INSERT-DATE/$DATE/g" $TGMSAHOME/reports/$YDATE/$DATE/report-$DATE.html
sed -i "s/:/./g" $TGMSAHOME/reports/$YDATE/$DATE/report-$DATE.csv
sed -i "s/;/,/g" $TGMSAHOME/reports/$YDATE/$DATE/report-$DATE.csv
#end daily report

#monthly report
cp html-template/monthly-all-box-template.html $REPORTSHOME/$YDATE/$MDATE/$MDATE.html
sed -i "s/INSERT-MONTHLY-DATE/$MDATE/g" $REPORTSHOME/$YDATE/$MDATE/$MDATE.html
cat $TGMSAHOME/reports/$YDATE/$MDATE/$MDATE-BOX-*.csv > $TGMSAHOME/reports/$YDATE/$MDATE/all-data.csv
sed -i "s/:/./g" $TGMSAHOME/reports/$YDATE/$MDATE/all-data.csv
#end montrly report

#replace in main index.html
sed -i "/INSERT HERE DAILY/a <option VALUE='https://tgmsa.vipkam.pl/$YDATE/$DATE/report-$DATE.html'>$REPORTDATE</option>" $TGMSAHOME/reports/index.html

grep -rH "https://tgmsa.vipkam.pl/$YDATE/$MDATE/$MDATE.html" $TGMSAHOME/reports/index.html
if [ $? -eq 1 ]; then
	sed -i "/INSERT HERE MONTHLY/a <option VALUE='https://tgmsa.vipkam.pl/$YDATE/$MDATE/$MDATE.html'>$MREPORTDATE</option>" $TGMSAHOME/reports/index.html
fi

#end replace in main index.html
