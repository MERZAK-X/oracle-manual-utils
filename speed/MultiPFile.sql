SHOW PARAMETER control_files
ACCEPT ctrlFile char prompt '[+] Enter existing source control file (.CTL) path : '
ACCEPT ctrlFileCopy char prompt '[+] Enter NEW control file (.CTL) path : '
SELECT '&ctrlFile' FROM DUAL;
SHUTDOWN IMMEDIATE
host copy &ctrlFile &ctrlFileCopy
ACCEPT pfile_path char prompt '[+] Enter PFILE (init.ora) path : '
HOST notepad &pfile_path
STARTUP
