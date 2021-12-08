# Speicherort
$path = "D:\FilesToPrint\"
echo "Drucke alle Dateien in $path"

# Alle Files drucken
$files = Get-ChildItem -Path $path -recurse -Filter "*.java"
foreach ($file in $files) { Start-Process –FilePath $path\$file –Verb Print -PassThru | %{sleep 10;$_} | kill     }


echo "Druckauftrag beendet"