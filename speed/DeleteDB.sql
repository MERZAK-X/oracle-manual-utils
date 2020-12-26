prompt ##################### SHUTTING DOWN DATABASE #####################
SHUTDOWN IMMEDIATE;

prompt ##################### STARTRTING UP IN EXCLUSIVE RESTRICT MODE #####################
STARTUP MOUNT EXCLUSIVE RESTRICT;

prompt ##################### DROPPING DATABASE #####################
DROP DATABASE;
EXIT;
