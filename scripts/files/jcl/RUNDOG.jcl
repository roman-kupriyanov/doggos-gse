//<RUNDOG>  JOB ACCT#,REGION=0M,CLASS=A
//RUN      EXEC PGM=DOGGOS
//STEPLIB    DD DISP=SHR,DSN=&SYSUID..PUBLIC.LOADLIB
//ADOPTS     DD DISP=SHR,DSN=&SYSUID..PUBLIC.INPUT
//OUTREP     DD SYSOUT=*
//SYSOUT     DD SYSOUT=*