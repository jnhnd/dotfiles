@echo off
pandoc %1 --reference-docx=%HOMEPATH%\Documents\template\silcot.docx -s -o "%~dpn1.docx"
