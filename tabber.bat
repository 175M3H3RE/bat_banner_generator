@Echo Off
echo. Banner Maker--------------==========
REM CLS
set variable_0=
set variable_1=
set variable_2=
set variable_3=
set /a space_0=0
set /a space_1=0
set /a space_2=0
set /a space_3=0

echo Use the line below as word counter reference:
echo              -----------------------------------------------------------------
set /a counter=-1
:looper
set /a counter+=1
:repeat
set /a wisdom=%counter%

set /p variable_%wisdom%=Enter line %wisdom%:
if %counter% GEQ 3 goto next
:next
set /a bottom_line=0
CALL set test=x%%variable_%wisdom%%%x
if "%test%"=="xx" set /a spaces_%counter%=64&goto continue
for /l %%i in (%counter%,1,%counter%) do  CALL CALL :SOMETHING "%%variable_%%i%%"
if %bottom_line% GTR 65 echo. limit exceeds&echo.re-enter&goto repeat
if %bottom_line% LEQ 65 set /a spaces_%counter%=65-bottom_line

:continue
if %counter% LSS 2 goto looper
goto :makebanner
:SOMETHING
set somethingsomething=%~1
for /l %%i in (0,1,64) do call :count %%i
Exit /B
:count
set /a something=%1
CALL set str=%%somethingsomething:~%something%,1%%
IF "%str%" NEQ "" (set /a bottom_line+=1)
Exit /B
:makebanner
echo. Making Banner.
timeout 1 >NUL
pause
REM cls
:1
set shift=%1
if "%shift%"=="pick" echo %echo1% >write.banner.code.bat
if "%shift%"=="pick" for /l %%i in (0,1,%counter%) do CALL :writecode "%%variable_%%i%%" %%spaces_%%i%%
if "%shift%"=="pick" echo %echo2% >>write.banner.code.bat
if "%shift%"=="pick" Exit /B
echo.1
set echo1=echo  -----------------------------------------------------------------
set echo2=echo  -----------------------------------------------------------------
%echo1%
for /l %%i in (0,1,%counter%) do CALL :echovariable "%%variable_%%i%%" %%spaces_%%i%%
%echo2%

:2
set shift=%1
set echo1=echo /.****************************************************************\
set echo2=echo \.______________________________________________________________./
if "%shift%"=="pick" echo %echo1% >write.banner.code.bat
if "%shift%"=="pick" for /l %%i in (0,1,%counter%) do CALL :writecode "%%variable_%%i%%" %%spaces_%%i%%
if "%shift%"=="pick" echo %echo2% >>write.banner.code.bat
if "%shift%"=="pick" Exit /B
echo.2

%echo1%
for /l %%i in (0,1,%counter%) do CALL :echovariable "%%variable_%%i%%" %%spaces_%%i%%
%echo2%

:3
set shift=%1
set echo1=echo +-----------------------------------------------------------------+
set echo2=echo +-----------------------------------------------------------------+
if "%shift%"=="pick" echo %echo1% >write.banner.code.bat
if "%shift%"=="pick" for /l %%i in (0,1,%counter%) do CALL :writecode "%%variable_%%i%%" %%spaces_%%i%%
if "%shift%"=="pick" echo %echo2% >>write.banner.code.bat
if "%shift%"=="pick" Exit /B
echo.3

%echo1%
for /l %%i in (0,1,%counter%) do CALL :echovariable "%%variable_%%i%%" %%spaces_%%i%%
%echo2%

:4
set shift=%1
set echo1=echo +-----------------------------------------------------------------+
set echo2=echo +-----------------------------------------------------------------+
echo.4

%echo1%
for /l %%i in (0,1,%counter%) do CALL :echovariable "%%variable_%%i%%" %%spaces_%%i%%
%echo2%
if "%shift%"=="pick" echo %echo1% >write.banner.code.bat
if "%shift%"=="pick" for /l %%i in (0,1,%counter%) do CALL :writecode "%%variable_%%i%%" %%spaces_%%i%%
if "%shift%"=="pick" echo %echo2% >>write.banner.code.bat
if "%shift%"=="pick" Exit /B


choice /c 1234 /m "Enter a Choice:" /N
if %errorlevel%==1 call :1 pick
if %errorlevel%==2 call :2 pick
if %errorlevel%==3 call :3 pick
if %errorlevel%==4 call :4 pick
goto :eof
:echovariable
setlocal enabledelayedexpansion
set spaces=
set number=%2
if %number% NEQ 0 for /l %%i in (1,1,%number%) do set spaces= !spaces!
set spaces=^^^|%~1!spaces!^^^|
echo !spaces!
REM echo ^|%~1%spaces%^|
Exit /B
:writecode
setlocal enabledelayedexpansion
set spaces=
set number=%2
if %number% NEQ 0 for /l %%i in (1,1,%number%) do set spaces= !spaces!&echo. >NUL
set spaces=^^^^^|%~1!spaces!^^^^^|
echo echo.!spaces! >>write.banner.code.bat
REM echo ^|%~1%spaces%^|
Exit /B
