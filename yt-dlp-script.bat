@echo off
REM KlimasTech.eu.org
REM yt-dlp-script v0.1
REM 07.10.2024

REM Aktualizacja yt-dlp
echo Sprawdzanie aktualizacji...
yt-dlp.exe -U

REM Sprawdzenie, czy plik yt-dl.exe.new istnieje
if exist yt-dlp.exe.new (
    echo Plik yt-dlp.exe.new znaleziony. Aktualizowanie yt-dlp.exe...
    
    REM Usuniecie starego pliku yt-dlp.exe
    if exist yt-dlp.exe (
        del yt-dlp.exe
        echo Plik yt-dlp.exe zostal usuniety.
    )
    
    REM Zmiana nazwy yt-dlp.new na yt-dlp.exe
    rename yt-dlp.exe.new yt-dlp.exe
    echo Plik yt-dlp.exe.new zostal zmieniony na yt-dlp.exe.
) else (
    echo Brak pliku yt-dlp.exe.new. Brak potrzeby aktualizacji.
)

REM Sprawdź dostępne formaty AUDIO-VIDEO
set /p URL=Podaj adres URL YouTube: 
echo Sprawdzam dostepne formaty audio-video dla adresu: %URL%
yt-dlp.exe %URL% -F

REM Pobierz konkretny format AUDIO-VIDEO
set /p FORMAT=Podaj format VIDEO: 
echo Pobieram plik z adresu: %URL%
yt-dlp.exe %URL% -f %FORMAT%+bestaudio
pause
