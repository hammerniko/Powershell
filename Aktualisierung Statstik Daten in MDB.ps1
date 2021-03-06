#Bildschirm loeschen
cls

# Globale Variable
$aktuellesJahr = 2021
$user = "hr"

# --------------------------------------------------------------- Funktionen
function enter(){
    Read-Host -Prompt "weiter mit Enter..."
    echo "--------------------------------"
}

function aktExportASV(){
    start-Process C:\ASV\Client\asv-bw.exe 
    echo "starte ASV..."
    echo "-Menü Auswertungen -> Exportformate auswählen"
    echo "-Unter Navigator Im Datenbereich den Eintrag Schüler auswählen"
    echo "-das Exportformat StatistikExport auswählen"
    echo "-Datensätze für den Export auswählen anklicken"
    echo "-Alle Klassen markieren und in Datei exportASV auf Lw. H: exportieren"
    enter
    
    #EXCEL ***************************************************************************
    #EXCEL als Object laden
    $excel = New-Object -ComObject Excel.Application
    echo "-Excel laden"

    #EXCEL Sichtbar machen
    $excel.Visible = $true

    #Workbook öffnen wenn vorhanden
    $pathWorkbook = "H:\Statistik\"+$aktuellesJahr+"\exportASV.xls"
    $workbook = $excel.Workbooks.Open($pathWorkbook)
    echo "-Öffnen der Tabelle: $pathWorkbook"

    #Sheet laden und aktivieren
    $sheetname = "exportASV.xls"
    $sheet = $excel.Sheets.Item($sheetname)
    $sheet.Activate()
    echo "-aktiviere Sheet $sheetname"

    #Spalte Klassenstufe hinzufügen
    $row = 1
    $column = 38
    $sheet.Cells.Item($row,$column) = "Klassenstufe"

    #Workbook speichern und schließen
    $excel.ActiveWorkbook.Save()
    $excel.Workbooks.Close()
    $excel.Quit()
    echo Excel-Tabelle exportASV.xls aktualisiert
    enter

    
}

function aktExportKurslisten(){
    echo "-Menü Auswertungen -> Exportformate auswählen"
    echo "-Unter Navigator Im Datenbereich den Eintrag 'Schüler im Kurs' auswählen"
    echo "-Exportformat zz Schüler im Kurs Name Klasse KL Kursbez Fach-LK  "
    echo "-Export der Schülerdaten aller Klassen in Datei exportKurslisten.xls auf Lw H:"
    enter
}

function aktAccessDB(){
    
   $accessApp = new-object -com access.application
   $accessApp.Application.OpenCurrentDatabase("H:\Statistik\2021\Stat2021.accdb")
   $accessApp.Visible = $true

   #.... 
    
}

# ------------------------------------------------------------------ABLAUF
# Aktualisieren der Daten aus ASV 
# und speichern in der Statistik Datenbank
# ******************************     ASV Daten exportieren
#aktExportASV
#aktExportKurslisten
#aktAccessDB



echo "Aktualisierung fertig"
