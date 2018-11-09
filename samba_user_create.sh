#!/bin/bash
NEW_USERS="/home/administrator/osoby"
cat $NEW_USERS | \
while read nazwisko imie
do
literka=$(echo $imie | head -c 1)
login=$(echo $literka$nazwisko)
haslo=$(echo ${imie}99!)
#echo $login
sleep 1s
samba-tool user add $login $haslo --given-name=$imie --surname=$nazwisko  --must-change-at-next-login
echo $login" / "$haslo >> uzytkownicy.txt
done
