cls
# Aktualisieren der Daten aus ASV 
# und speichern in der Statistik Datenbank
$aktuellesJahr = 2021
$user = "hr"

#ASV Starten
#start-Process -FilePath C:\ASV\Client\asv-bw.exe -ArgumentList 'hr'
start-Process -FilePath C:\ASV\Client\asv-bw.exe 
echo "-Starte ASV"


#ASV Login von Hand
echo "-Bitte einloggen"


#ASV ASV -> Exportformat -> Schüler im Kurs auswählen 
#-> Exportformat zz Schüler im Kurs Name Klasse KL Kursbez Fach-LK  
#-> Export der Schülerdaten aller Klassen in Datei exportKurslisten.xls
