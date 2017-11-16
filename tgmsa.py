#!/Library/Frameworks/Python.framework/Versions/3.6/bin/python3
# coding=utf-8

import pymysql.cursors
import maya
import pandas as pd
import os

reports_dir='/Users/stachu/work/tgmsa/reports'

eports_dir = os.path.join(
    os.path.dirname(os.path.abspath(__file__)),
    'reports'
)
# tworzymy katalog jesli go nie ma
#os.makedirs(reports_dir, exist_ok=True)

# funkcja pobierająca informacje o czasu pracy boxów z bazy mysql
def query_db(box_id, start_date=maya.now()):
    # domyślna data poczatkowa to dzien dzisiejszy
    # data końcowa to zawsze data początkowa + 1 dzień
    end_date = start_date.add(days=1)

    # daty w formie rozumianej przez mysql
    start_date_text = start_date.datetime().strftime("%Y-%m-%d")
    end_date_text = end_date.datetime().strftime("%Y-%m-%d")

    # obiekt reprezentujacy polaczenie do bazy
    # uzylem pymysqla zamiast MySQLdb bo nie chciało mi się zainstalować
    connection = pymysql.connect(
        host='localhost',
        user='root',
        password='root',
        db='accoDb',
        cursorclass=pymysql.cursors.DictCursor)

    # lepiej tego nie tykać :D
    query = ("SELECT czasZdarzenia, idStrefaWejsciowa, nazwaStrefyWejsciowej, nazwaStrefyWyjsciowej, idStrefaWyjsciowa, idKontroler, szczegoly, nazwaKontrolera FROM Zdarzenie a WHERE (idUzytkownik = %s) AND (kodZdarzenia = 263) AND (czasZdarzenia >= %s) AND (czasZdarzenia < %s) AND (idStrefaWejsciowa = '1' OR idStrefaWyjsciowa = '1') AND (SUBSTR(CONV(HEX(szczegoly),16,2), -12, 1) !=1) ORDER BY czasZdarzenia ASC;")

    # panda jest w stanie stworzyć DataFrame wykorzystujac zapytanie SQL
    df = pd.read_sql(query, connection,
        params=(box_id, start_date_text, end_date_text))

    # dodaj kolumne id boxa
    df['box_id'] = box_id
    #print(df.iloc[0])
    #print(df.iloc[-1])
    czasy = df['czasZdarzenia']

    if czasy.empty:
        start_work = maya.when('00:00:00')
        stop_work = maya.when('00:00:00')
        worked = 0
        timesss = maya.MayaDT.datetime(stop_work)
        print(timesss)
        print('czas', timesss.time().strftime('%H.%M'))
    else:
        start_work = czasy.iloc[0]
        stop_work = czasy.iloc[-1]
        worked = stop_work - start_work

    print(box_id, start_work, stop_work, worked)

    return box_id, start_work, stop_work, worked


def main():
    for box in range(414, 415):
        query_db(box, start_date=maya.when('2017-05-11'))
    print('hello')

if __name__ == '__main__':
    main()