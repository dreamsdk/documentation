@echo off
set APP_TITLE=DreamSDK Help Online Producer
title %APP_TITLE%
cls

rem Initialization
set BASE_DIR=%~dp0
set BASE_DIR=%BASE_DIR:~0,-1%

set LOG_FILE=%BASE_DIR%\online.log
if exist %LOG_FILE% del %LOG_FILE%

call :log %APP_TITLE%
call :log

:init
set ONLINE_INPUT_DIR=src
set CONTENT_INPUT_DIR=..\src

set ONLINE_OUTPUT_DIR=dist
set ONLINE_DATA_OUTPUT_DIR=%ONLINE_OUTPUT_DIR%\data

:start
pushd .

call :log Copying Online Bootstrap Website...
call :copy %ONLINE_INPUT_DIR% %ONLINE_OUTPUT_DIR%
if exist %ONLINE_DATA_OUTPUT_DIR%\README.md del %ONLINE_DATA_OUTPUT_DIR%\README.md

call :log Copying Content...
call :copy %CONTENT_INPUT_DIR% %ONLINE_DATA_OUTPUT_DIR%
if exist %ONLINE_DATA_OUTPUT_DIR%\dreamsdk.* del %ONLINE_DATA_OUTPUT_DIR%\dreamsdk.*

:finish
call :log
call :log Done!
call :log You can now upload the "dist" directory content.
call :log
goto end

:end
popd
pause
goto :EOF

rem ## Utilities ###############################################################

:log
set tmplog=%*
if "%tmplog%"=="" goto logempty
echo %tmplog%
echo %tmplog%>> %LOG_FILE% 2>&1
goto :EOF
:logempty
echo.
echo.>> %LOG_FILE% 2>&1
goto :EOF

:copy
set EXCLUDE_FILE=%BASE_DIR%\exclude.txt
echo .git\ > %EXCLUDE_FILE%
echo .svn\ >> %EXCLUDE_FILE%
xcopy %1\* %2 /exclude:%EXCLUDE_FILE% /s /i /y >> %LOG_FILE% 2>&1
if exist %EXCLUDE_FILE% del %EXCLUDE_FILE%
goto :EOF
