import maya
from maya import MayaInterval
import pandas as pd
import pymysql
import csv
import datetime
from datetime import datetime
import sys
import os


def query_db(box_id, start_date=maya.now()):
    """Function for query db and get data"""

    end_date = start_date

    start_date_text = start_date.datetime().strftime("%Y-%m-%d")
    db_start_date = start_date_text + ' 23:59:59'
    end_date_text = end_date.datetime().strftime("%Y-%m-%d")
    db_end_date = end_date_text + ' 00:00:00'

    connection = pymysql.connect(
        host='192.168.0.15', #localhost
        user='root',
        password='root',
        db='accoDb',
        cursorclass=pymysql.cursors.DictCursor)

    query = ("SELECT event_time FROM event e LEFT JOIN event_user ON event_user.event_id = e.id WHERE e.source IN (10)"
             " AND e.event_time <= %s AND event_user.user_id IN (%s) AND e.event_time >= %s AND e.code IN (263)"
             " ORDER BY e.event_time ASC  LIMIT 0,10000;")

    df = pd.read_sql(
        query,
        connection,
        params=(db_start_date, box_id, db_end_date))

    df['box_id'] = box_id
    #print(df[['box_id', 'event_time']])


    return(df[['box_id', 'event_time']])
#End query_db




def daily_box_report(df):
    """Daily report function"""

    if df.empty:
        #enter_time = maya.when('00:00')
        #exit_time = maya.when('00:00')
        #worked_time = maya.when('00:00')

        enter_time = '00:00'
        exit_time = '00:00'
        worked_time = '00:00'

    else:
        enter_time = df['event_time'].iloc[0]
        exit_time = df['event_time'].iloc[-1]
        worked_time = exit_time - enter_time
        worked_time = "%d:%d" % (worked_time.seconds / 3600, worked_time.seconds % 3600 / 60)

        enter_time = enter_time.time().strftime('%H.%M')
        exit_time = exit_time.time().strftime('%H.%M')
        worked_time = str(worked_time)
        #print(worked_time)

    #print('godzina wejscia: ', enter_time, '| ''godzina wyjscia: ', exit_time, ' |''przepracowano: ', worked_time)

    #print(box_id, enter_time, exit_time, worked_time)
    return enter_time, exit_time, worked_time

#End daily_box_report


def create_daily_csv(box_id, enter_time, exit_time, worked_time, df, date):

    date = maya.when(date)
    report_dir = '/Users/stachu/work/tgmsa-reports/reports/'

    yearly_report=str(date.year)
    monthly_report=str(date.year)+'-'+str(date.month)
    #daily_report=str(date.year)+'-'+str(date.month)+'-'+str(date.day)
    daily_report=str(date.datetime().strftime("%Y-%m-%d"))
    box_id_dir = str(box_id)
    box_id = int(box_id)

    with open(os.path.join(report_dir, yearly_report, daily_report, "report-{}.csv".format(daily_report)), "a") as csv_file:
        writer = csv.writer(csv_file, delimiter=';')
        writer.writerow(["BOX-{}".format(box_id), enter_time, exit_time, worked_time])

#End create_daily_csv

def main():
    """Main function"""
    box = sys.argv[1]
    date = sys.argv[2]

    print('box', box)
    print('date', date)

    df = query_db(box, start_date=maya.when(date))
    enter_time, exit_time, worked_time = daily_box_report(df)
    create_daily_csv(box, enter_time, exit_time, worked_time, df, date)
    print(box, enter_time, exit_time, worked_time)

#End main


if __name__ == '__main__':
    main()
