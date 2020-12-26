:: Made by @MERZAK-X

@echo off
cls
echo.

set /p oracle_sid="[+] Set ORACLE_SID : "

echo "[!] ORACLE_SID SET TO " %ORACLE_SID%

echo.

sqlplus -S / as SYSDBA @"%oracle_base%\speed\DeleteDB.sql"
