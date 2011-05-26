@echo off

rem sprawdz czy jpsoft
if not "%@eval[2+2]" == "4" goto helpver

rem sprawdz czy 4NT lub TCC
if "%_cmdproc" == "4DOS" goto helpver

rem pomoc
if "%1" == "-h" .or. "%1" == "-help" .or. "%1" == "/h" .or. "%1" == "/help" .or. "%1" = "-?" .or. "%1" == "/?" goto help

rem polecenia
echo OK. Srodowisko %_cmdproc w wersji %_4ver.
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
echo Uzycie:
echo   %0 [-all] : wyswietla tylko informacje o architekturze
echo   %0 -arch  : wyswietla wszystkie informacje
echo Wywolanie bez flagi jest rownoznaczne fladze -all.
goto end


:helpver
echo Makro wymaga srodowiska 4NT lub TCC.
echo Aktualne srodowisko to:
ver
goto end


:end
