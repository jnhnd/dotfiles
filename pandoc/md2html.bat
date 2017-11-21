@echo off
pandoc %1 --from=markdown --to=html5 -s --self-contained --css=%HOMEPATH%"\AppData\Roaming\pandoc\monster.css" -o "%~dpn1.html"
