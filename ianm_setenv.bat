@echo off
:: ianm_setenv.bat
:: Setup environment for the current DOS session.
::
:: Favourite colours to use.
:: Screen Text: 232/218/153
::
:: Last updated: 17 March 2019 17:37:54
::

:: (1,1,4) means (<Start#>,<Step#>,<End#>):
:: Start = 1
:: Increment per step = 1
:: End = 4
::
cls
FOR /L %%A IN (1,1,4) DO (
   echo.
)
echo Setting up for the current DOS session
echo Computer name: %computername%
echo User name: %username%

:: ****************************************************
:: Setup Oracle related environment variables (if used)
:: ****************************************************
FOR /L %%A IN (1,1,4) DO (
   echo.
)
set ORACLE_SID=ORCL
set ORACLE_HOME=D:\oracle\product\11.2.0\dbhome_1
set NLS_DATE_FORMAT=YYYY-MM-DD HH24:MI:SS
:: We may or may not have to set TNS_ADMIN. But we’ll
:: do it anyway just in case.
set TNS_ADMIN=D:\oracle\product\11.2.0\dbhome_1\network\admin
set AGENT_HOME=E:\oracle\agent\11.2.0\dbhome_1

:: Show the user what Oracle environment variable we’ve setup.
echo Oracle related environment variables setup:
echo.
set ORACLE
set NLS
set TNS
set AGENT

:: *************************************************
:: List any Oracle database MS Windows services that
:: we may (or may not) have.
::
:: See also:
:: Ask the Performance Team Blog
:: https://blogs.technet.microsoft.com/askperf/2012/02/17/useful-wmic-queries/
:: *************************************************
FOR /L %%A IN (1,1,4) DO (
   echo.
)
echo Listing Oracle instances (if any). Please wait...
echo.
wmic /output:stdout service where 'name like "OracleService%%"' get DisplayName, State /format:table

:: ***************
:: Some DOS things
:: ***************

:: Change the cmd.exe command prompt.
:: For details on this, type "prompt /?" at the DOS prompt.
:: This will give the characters that can be used.
prompt $P$_$T$Sian$Q$Q$G$S

:: **********
:: Script end
:: **********
FOR /L %%A IN (1,1,3) DO (
   echo.
)
echo All done now!
echo.
:: *************
:: End of script
:: *************
