#!/usr/bin/python

import sys
import MySQLdb
import time
import datetime
import csv
import os
from contextlib import contextmanager

tgmsa_home = '/home/admin/tgmsa'
report_dir = tgmsa_home+'/reports'

@contextmanager
def db_connection(host, user, passwd, db):
    try:
        connection = MySQLdb.connect(host=host, user=user, passwd=passwd, db=db)
        cursor = connection.cursor()
        yield cursor
    except Exception as e:
        print(e)
    finally:
        cursor.close()
        connection.close()
#End db_connection


def get_data(box_id, day_start=datetime.datetime.now()):

    day_end=day_start + datetime.timedelta(days=1)
    day_start = day_start.strftime("%Y-%m-%d")
    day_end = day_end.strftime("%Y-%m-%d")

    query=("SELECT czasZdarzenia, idStrefaWejsciowa, nazwaStrefyWejsciowej, nazwaStrefyWyjsciowej, idStrefaWyjsciowa, idKontroler, szczegoly, nazwaKontrolera FROM Zdarzenie a WHERE (idUzytkownik = %s) AND (kodZdarzenia = 263) AND (czasZdarzenia >= %s) AND (czasZdarzenia < %s) AND (idStrefaWejsciowa = '1' OR idStrefaWyjsciowa = '1') AND (SUBSTR(CONV(HEX(szczegoly),16,2), -12, 1) !=1) ORDER BY czasZdarzenia ASC;")
    with db_connection('127.0.0.1', 'tgmsa', 'password', 'accoDb') as db:
        db.execute(query, (box_id, day_start, day_end))
        data = db.fetchall() or ('0,0')
        #print(data)
        return data
#End get_data(


def calculate_worked_time(data):
    start=data[0][0]
    end=data[-1][0]
    print(start)
    print(end)

    if start == '0' or end == '0':
        worked = '0,0'
        start = '0,0'
        end = '0,0'
        worked = datetime.time(0, 0, 0) # datetime.datetime.strptime(worked, '%H,%M')
        start = datetime.datetime.strptime(start, '%H,%M')
        end = datetime.datetime.strptime(end, '%H,%M')
    else:
        worked = end - start

    #worked=end-start
    print(worked)
    return start.time().strftime('%H.%M'), end.time().strftime('%H.%M'), worked
#End calculate_worked_time

 
def create_csv(root_directory, box_id, start, end, worked, date=datetime.datetime.now()):
    yearly_report=str(date.year)
    monthly_report=str(date.month)
    daily_report=str(date.day)
    box_id_dir = str(box_id)
   
    try: 
        os.makedirs(os.path.join(root_directory, yearly_report, monthly_report, daily_report, box_id_dir))
    except:
        pass

    with open(os.path.join(report_dir, yearly_report, monthly_report, daily_report, box_id_dir, "box-{}.csv".format(box_id)), "w") as csv_file:
        writer = csv.writer(csv_file, delimiter=';')
        writer.writerow(["box-{}".format(box_id), start, end, worked])

    with open(os.path.join(report_dir, yearly_report, monthly_report, daily_report, "all-daily-data.csv"), "a") as csv_file:
        writer = csv.writer(csv_file, delimiter=';')
        writer.writerow(["box-{}".format(box_id), worked])

    with open(os.path.join(report_dir, yearly_report, monthly_report, daily_report,  box_id_dir, "all-{}.csv".format(box_id)), "a") as csv_file:
        writer = csv.writer(csv_file, delimiter=';')
        writer.writerow([worked])


    with open(os.path.join(report_dir, yearly_report, monthly_report, daily_report, box_id_dir, "all-{}.csv".format(box_id)), "rb") as csv_file:
        reader = csv.reader(csv_file)
        for row in reader:
            all_time = row[0]
            print('czas caly: ', row)
        all_time_split = all_time.split(':')
        all_time = datetime.timedelta(hours=int(all_time_split[0]), minutes=int(all_time_split[1]), seconds=int(all_time_split[2]))
        print('po split:', all_time)

        with open(os.path.join(report_dir, yearly_report, monthly_report, daily_report, box_id_dir, "all-{}.csv".format(box_id)), "w") as csv_file:
            writer = csv.writer(csv_file)
            #writer.writerow([all_time + worked])


#End create_csv


def create_monthly_csv(root_directory, box_id, start, end, worked, date=datetime.datetime.now()):
    yearly_report = str(date.year)
    monthly_report = str(date.month)
    daily_report = str(date.day)
    box_id_dir = str(box_id)

    os.makedirs(os.path.join(root_directory, yearly_report, monthly_report, daily_report, box_id_dir))

    with open(os.path.join(report_dir, yearly_report, monthly_report, daily_report, box_id_dir, "all-{}.csv".format(box_id)), "a") as csv_file:
        writer = csv.writer(csv_file, delimiter=';')
        writer.writerow([worked])


#End create_monthly_csv


def create_dir_structure(root_directory, date=datetime.datetime.now()):
    yearly_report = str(date.year)
    monthly_report = str(date.month)
    daily_report = str(date.day)

    try:
        os.makedirs(os.path.join(root_directory, yearly_report, monthly_report, daily_report))
    except OSError:
        return
#End create_dir_structure


def main():
    """ Funcion """   
    print(tgmsa_home)
    print(report_dir)
    create_dir_structure(report_dir, date=datetime.date(2017, 05, 10) )
    #create_dir_structure(report_dir)
    #print(worked)
    for box in range(405, 417):
        data = get_data(box, day_start=datetime.date(2017, 05, 10))
        start, end, worked = calculate_worked_time(data)
        create_csv(report_dir, box, start, end, worked, date=datetime.date(2017, 05, 10))
    #    create_monthly_csv(report_dir, box, start, end, worked, date=datetime.date(2017, 05, 10))
        print(box)
#End main

if __name__ == "__main__":
    main()
