SHOW PARAMETER CONTROL_FILES;
ACCEPT ctrlFile char prompt '[+] Enter existing source control file (.CTL) path : '
ACCEPT ctrlFileCopy char prompt '[+] Enter NEW control file (.CTL) path : '

SELECT '&ctrlFile' || '==>' || '&ctrlFileCopy' FROM DUAL;

prompt ##################### UPDATING CONTROL FILE SYSTEM PARAMETER #####################
ALTER SYSTEM SET control_files='&ctrlFile','&ctrlFileCopy' scope=spfile;

prompt ##################### SHUTTING DOWN DATABASE #####################
SHUTDOWN IMMEDIATE
ACCEPT ignore_me char prompt '[!] Press ENTER to continue ... '

prompt ##################### COPYING CONTROL FILE TO NEW PATH #####################
HOST copy &ctrlFile &ctrlFileCopy

prompt ##################### STARTING UP DATABASE #####################
STARTUP

prompt ##################### SHOWING UP CONTROL FILES #####################
SHOW PARAMETER CONTROL_FILES;
