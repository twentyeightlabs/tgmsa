import pymysql.cursors
import datetime
import maya
from maya import MayaInterval
import pandas as pd
import os

# katalog z raportami znajduje sie tam gdzie ten skrypt
reports_dir = os.path.join(
    os.path.dirname(os.path.abspath(__file__)),
    'reports'
)
# tworzymy katalog jesli go nie ma
os.makedirs(reports_dir, exist_ok=True)

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
        password='mysql',
        db='accoDb',
        cursorclass=pymysql.cursors.DictCursor)

    # lepiej tego nie tykać :D
    query = ("SELECT czasZdarzenia, idStrefaWejsciowa, nazwaStrefyWejsciowej, nazwaStrefyWyjsciowej, idStrefaWyjsciowa, idKontroler, szczegoly, nazwaKontrolera FROM Zdarzenie a WHERE (idUzytkownik = %s) AND (kodZdarzenia = 263) AND (czasZdarzenia >= %s) AND (czasZdarzenia < %s) AND (idStrefaWejsciowa = '1' OR idStrefaWyjsciowa = '1') AND (SUBSTR(CONV(HEX(szczegoly),16,2), -12, 1) !=1) ORDER BY czasZdarzenia ASC;")

    # panda jest w stanie stworzyć DataFrame wykorzystujac zapytanie SQL
    df = pd.read_sql(query, connection,
        params=(box_id, start_date_text, end_date_text))
    if df.empty:
        return

    # dodajemy do dataframe identyfikator boxa oraz czy
    df['box_id'] = box_id
    df['weyjscie'] = df.apply(lambda r: 1 if r['idStrefaWejsciowa'] == 1.0 else -1, axis=1)


    return df[['box_id', 'czasZdarzenia', 'weyjscie']]



def get_time_delta(date1, date2):
    d1 = maya.MayaDT.from_datetime(date1.to_pydatetime())
    d2 = maya.MayaDT.from_datetime(date2.to_pydatetime())
    interval = MayaInterval(start=d1, end=d2)
    return interval.timedelta



def box_day(box, day=maya.now()):
    df = query_db(box, start_date=day)
    day_empty = day.datetime(naive=True)
    if df is None:
        return pd.DataFrame({'box_id': [box], 'enter': [day_empty], 'exit': [day_empty], 'time_worked': [datetime.timedelta()]}, index=[box])

    # bierzemy tylko pierwszy i ostatni czas
    enter_time = df['czasZdarzenia'].iloc[0]
    exit_time = df['czasZdarzenia'].iloc[-1]

    # obliczamy przepracowany czas
    time_worked = get_time_delta(enter_time, exit_time)

    # tworzymy koncową ramke
    df = pd.DataFrame({
        'box_id': [box],
        'enter': [enter_time],
        'exit': [exit_time],
        'time_worked': [time_worked]
    }, index=[box])

    return df


def create_daily_report(box, day=maya.now()):
    # sciezka katalogu raportu = reports/year/month/day
    target_directory = os.path.join(reports_dir, str(day.year), str(day.month), str(day.day))
    # sciezka do raportu = reports/year/month/day/box-<id>.csv
    target_path = os.path.join(target_directory, 'box-{}.csv'.format(box))
    # tworzymy katalogi jesli nie ma
    os.makedirs(target_directory, exist_ok=True)

    # zbieramy informacje o boxie i zapisujemy wynik do pliku raportu
    box_report = box_day(box, day=day)
    box_report.to_csv(target_path, sep=';', index=False, header=False)


def create_allbox_daily_report(box_range_start, box_range_stop, day=maya.now()):
    # sciezka katalogu raportu = reports/year/month/day
    target_directory = os.path.join(reports_dir, str(day.year), str(day.month), str(day.day))
    # sciezka do raportu = reports/year/month/day/daily_report.csv
    target_path = os.path.join(target_directory, 'daily_report.csv')
    # tworzymy katalogi jesli nie ma
    os.makedirs(target_directory, exist_ok=True)

    boxes = []
    for box in range(box_range_start, box_range_stop):
        boxes.append(box_day(box, day=day))

    df = pd.concat(boxes)
    df.to_csv(target_path, sep=';', index=False, header=False)


def append_day_to_monthly_report(box_range_start, box_range_stop, date=maya.now()):
    # sciezka katalogu raportu = reports/year/month/day
    target_directory = os.path.join(reports_dir, str(date.year), str(date.month))
    # sciezka do raportu = reports/year/month/monthly_report.csv
    target_path = os.path.join(target_directory, 'monthly_report.csv')
    # tworzymy katalogi jesli nie ma
    os.makedirs(target_directory, exist_ok=True)

    # zbieramy informacje o boxach z danej daty i zestawiamy wszystkie wyniki do jednej ramki
    all_boxes_day = []
    for box in range(box_range_start, box_range_stop):
        all_boxes_day.append(box_day(box, day=date))

    boxes_day = pd.concat(all_boxes_day)

    # probujemy wczytac raport miesieczny i zrobic update przepracowanego czasu
    try:
        boxes_month = pd.read_csv(target_path, sep=';', index_col=0, names=['box_id', 'time_worked'])
        #tutaj merge
        # new_boxes_month = boxes_month.merge(boxes_day[['box_id', 'time_worked']], how='outer', left_on=['box_id'], right_on=['box_id']).sum(axis=1)

    except FileNotFoundError:
        new_boxes_month = boxes_day[['box_id', 'time_worked']]
        pass

    new_boxes_month.to_csv(target_path, sep=';', index=False, header=False)



hit = maya.when('2017-05-10')
# for box in range(405, 417):

# box_worked_time(415, day=hit)
#
# boxes = []
# for box in range(405, 417):
#     boxes.append(box_day(box, day=hit))
#     create_daily_report(box, day=hit)

# create_allbox_daily_report(405, 417, day=hit)
append_day_to_monthly_report(405, 417, date=hit)