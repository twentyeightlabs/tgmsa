#!/bin/bash
mysql <<MY_QUERY
USE accoDb
SELECT czasZdarzenia, idStrefaWejsciowa, nazwaStrefyWejsciowej, nazwaStrefyWyjsciowej, idStrefaWyjsciowa, idKontroler, szczegoly, nazwaKontrolera FROM Zdarzenie a WHERE (idUzytkownik =393) AND (kodZdarzenia = 263) AND (czasZdarzenia >= "2017-04-01") AND (czasZdarzenia < "2017-04-02") AND (SUBSTR(CONV(HEX(szczegoly),16,2), -12, 1) !=1) ORDER BY czasZdarzenia ASC
MY_QUERY
