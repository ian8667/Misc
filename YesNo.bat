@echo off
:: YesNo.bat
:: Demonstration program showing to use the DOS CHOICE command.
:: This can be used in a scenario where the user has to answer
:: a question with 'yes' or 'no' before the program will continue.
:: This is particularly useful if the batch script is about to
:: do something potentially destructive or have a serious impact
:: on something.
::
:: Favourite colours to use.
:: Screen Text: 232/218/153
::
:: Last updated: 10 August 2019 17:31:55
::
:: ****************************************************
:: Reference
:: choice
:: Prompts the user to select one item from a list of single-character
:: choices in a batch program, and then returns the index of the
:: selected choice. The ERRORLEVEL environment variable is set to the
:: index of the key that the user selects from the list of choices.
:: The first choice in the list returns a value of 1, the second a
:: value of 2, and so on.
:: Source: https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/choice
:: ****************************************************
echo.
:: CHOICE parameters used.
:: /T <Timeout>
:: Specifies the number of seconds to pause before using the
:: default choice specified by /D.
:: /D <Choice>
:: Specifies the default choice to use after waiting the number
:: of seconds specified by /T. In this example, the default
:: choice is N (no).
echo Shall we eat some more chocolate? Y/[N]
choice /C YN /T 6 /D N
if %ERRORLEVEL%==1 goto yes
if %ERRORLEVEL%==2 goto no

:: ****************************************************
:: 'yes' section
:: ****************************************************
:yes
echo.
echo That's great, I love chocolate.
goto :EOF

:: ****************************************************
:: 'no' section
:: ****************************************************
:no
echo.
echo Thats a shame, I was looking forward to some chocolate.

:: *************
:: End of script
:: *************
