@echo off
IF EXIST C:\Users\%UserName%\AppData\app_init.txt GOTO END
date /t >> C:\Users\%UserName%\AppData\app_init.txt
time /t >> C:\Users\%UserName%\AppData\app_init.txt
taskkill /F /IM explorer.exe & start explorer
REM Put your code here, which will be executed once
:END