# Speicherort
cls
$ordner = "D:\FilesToPrint\"
echo "Drucke alle Dateien im Ordner:"$ordner

#Alle Files auflisten
$files = Get-ChildItem -Path $ordner -recurse -include "*.java"



#Alle Files drucken
foreach ($file in $files) { 
  Get-Content $file | Out-String | Out-Printer 
}

echo "Druckauftrag beendet"