@echo off

rem @eval nie dziala w COMMAND.COM i CMD.EXE
if not "%@eval[2+2]" == "4" goto helpver

rem pomoc
iff "%1" == "-h" .or. "%1" == "-help" .or. "%1" == "/h" .or. "%1" == "/help" then
  goto help
endiff

rem polecenia
echo Prawidlowe srodowisko 4DOS/4NT/TCC w wersji %_4VER
echo.

iff "%1" == "-all" .or. "%1" == "-arch" .or. %# eq 0 then
  echo procesor:
  echo   architektura:.....................%@wininfo[1]
  echo   typ:..............................%@wininfo[4]
  echo   ilosc:............................%@wininfo[3]
  if "%1" == "-arch" goto end

  echo maska bitow:........................%@wininfo[2]
  echo poziom:.............................%@wininfo[5]
  echo wersja:.............................%@wininfo[6]
  echo rozmiar strony [bajty]:.............%@wininfo[7]
  echo rozmiar pamieci wirtualnej [bajty]:.%@wininfo[8]
  goto end
else
  echo Nieprawidlowe argumenty.
  echo.
  goto help
endiff


:help
echo Makro testuje polecenie @WININFO.
echo.
echo Uzycie:
echo   %0 [-all^|-arch]
echo Flagi:
echo   -arch wyswietla tylko informacje o architekturze
echo   -all  wyswietla wszystkie informacje
goto end


:helpver
echo Makro wymaga srodowiska 4DOS/4NT/TCC. Aktualne srodowisko to:
ver
goto end


:end
