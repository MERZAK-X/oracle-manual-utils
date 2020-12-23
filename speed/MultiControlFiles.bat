@echo off 
call banner.bat
echo.

echo                               +-------------------------------------------+
echo                               ^|   Multi. Control Files                    ^|   
echo                               +---+---------------------------------------+
echo                               ^| 1 ^|  Multi. using SPfile                 ^|
echo                               +---+---------------------------------------+
echo                               ^| 2 ^|  Multi. using Pfile                  ^|
echo                               +---+---------------------------------------+
echo                               ^| 3 ^|  Go back to Menu.                    ^|
echo                               +---+---------------------------------------+
echo.
echo.

:RETRY
set /p selected="[+] Enter your selected option: "

echo.
echo.

IF %selected%==1 ( 
   set oracle_sid=%DB_Name%
   call  sqlplus / as sysdba @"MultiSPFile.sql" 
   pause
	
) ELSE IF %selected%==2 (

  set oracle_sid=%DB_Name%
  call  sqlplus / as sysdba @"MultiPFile.sql" 
  
) ELSE IF %selected%==3 (

    exit /B
	
) ELSE ( 

    GOTO:RETRY 
)
  
GOTO:RETRY 

