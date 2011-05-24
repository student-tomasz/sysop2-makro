@echo off

rem _cmdproc zawiera nazwe shella
if not "%_cmdproc" == "4DOS" goto helpver

rem pomoc
if "%1" == "-h" .or. "%1" == "-help" .or. "%1" == "/h" .or. "%1" == "/help" goto help

rem polecenia
echo OK. Srodowisko 4DOS w wersji %_4ver.
echo.
iff "%1" == "-test" .or. "%#" == "0" then
  set /m student=tomasz
  set /m indeks=211552
  echo @master[student] == %@master[student]
  echo @master[indeks]  == %@master[indeks]
  unset /m student
  unset /m indeks
else iff "%#" == "1" then 
  echo @master[%1] == %@master[%1]
else
  echo Mozna przekazac tylko jeden argument z linii polecen.
  echo.
  goto help
endiff
goto end

:help
echo Makro testuje polecenie @MASTER.
echo.
echo Uzycie:
echo   %0 [-test]
echo   %0 variable_name
echo.
echo Wywolanie z flaga -test powoduje ustawianie dwoch zmiennych i
echo wyswietlenie ich wartosci.
echo Wywolanie bez flagi jest rownoznaczne wywolaniu z flaga -test.
echo.
echo Wywolanie z argumentem powoduje wyswietlenie wartosci
echo zmiennej o nazwie 'variable_name'.
goto end

:helpver
echo Makro wymaga srodowiska 4DOS. Aktualne srodowisko:
ver
goto end

:end
