@echo off

call banner.bat
echo                               +-------------------------------------------+
echo                               ^|     Main Menu   [RUN_ME as ADMIN]         ^|   
echo                               +---+---------------------------------------+
echo                               ^| 1 ^|    Create a new Database             ^|
echo                               +---+---------------------------------------+
echo                               ^| 2 ^|    Multi. control files              ^|
echo                               +---+---------------------------------------+
echo                               ^| 3 ^|    Multi. journal files              ^|
echo                               +---+---------------------------------------+
echo                               ^| 4 ^|    Quit.                             ^|
echo                               +---+---------------------------------------+
echo.

:RETRY
set /p selected="[+] Enter your selected option: "

IF %selected%==1 (

    call CreateDB.bat 
	
) ELSE IF %selected%==2 (

    call MultiControlFiles.bat 
	
) ELSE IF %selected%==3 (

    exit /B
	
) ELSE IF %selected%==4 (

    exit /B
	
) ELSE (

    GOTO:RETRY
)
    GOTO:RETRY
