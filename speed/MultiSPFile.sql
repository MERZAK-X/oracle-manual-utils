SHOW PARAMETER control_files
ACCEPT ctrlFile char prompt '[+] Enter existing source control file (.CTL) path : '
ACCEPT ctrlFileCopy char prompt '[+] Enter NEW control file (.CTL) path : '
SELECT '&ctrlFile' || '==>' || '&ctrlFileCopy' FROM DUAL;
ALTER SYSTEM SET control_files='&ctrlFile','&ctrlFileCopy' scope=spfile;
SHUTDOWN IMMEDIATE
ACCEPT ignore_me char prompt '[!] Press ENTER to continue ... '
HOST copy &ctrlFile &ctrlFileCopy
STARTUP
