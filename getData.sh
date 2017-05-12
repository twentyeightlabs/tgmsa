#/bin/bash

TGMSAHOME=/root/tgmsa
BOXES=395
#DATE=`date +"%Y-%m-%d"`
DATE="2017-04-01"

for i in $(seq 393 395); do
	#echo $i
	#bash dbData.sh $i | grep -v czas| grep "2017-04-01" | awk 'NR==1; END{print}'|sed "s/'/\'/;s/\t/\",\"/g;s/^/\"/;s/$/\"/;s/\n//g"|tr '\n' ';'
	cd $TGMSAHOME
	mkdir $TGMSAHOME/$DATE
	bash $TGMSAHOME/dbData.sh $i | grep -v czas| grep "2017-04-01" | awk 'NR==1; END{print}'| sed "s/$DATE//g"|cut -d " " -f4|tr '\n' ',' >> $TGMSAHOME/$DATE/report-$DATE.csv
	BOXNAME=`mysql accoDb -e "select nazwaUzytkownika from Zdarzenie where (idUzytkownik = $i)"|sort -u|grep -v nazwaUzytkownika`
	echo $BOXNAME
done

#bash dbData.sh | grep -v czas | awk 'NR==1; END{print}'|sed "s/'/\'/;s/\t/\",\"/g;s/^/\"/;s/$/\"/;s/\n//g"|tr '\n' ';'
