@echo off
set PORT=57321
set FILE_NAME=markdown-editor.html
set FOLDER_PATH=C:\Users\Administrator\Documents\md-editor

echo Menjalankan Server di http://localhost:%PORT%
echo JANGAN TUTUP JENDELA INI SAAT MENGGUNAKAN EDITOR

:: Masuk ke folder dokumen
cd /d "%FOLDER_PATH%"

:: Membuka browser otomatis ke file tersebut
start "" "http://localhost:%PORT%/%FILE_NAME%"

:: Menjalankan server python
python -m http.server %PORT%

pause