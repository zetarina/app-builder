@echo off
call config.bat

REM Ensure React build folder exists
if exist "%REACT_BUILD_PATH%" (
    REM Copy React build into the server's dist/deploy folder
    xcopy /E /I /Y "%REACT_BUILD_PATH%\*" "%SERVER_DIST_PATH%/deploy/"
    echo React build folder copied to server's dist/deploy.
) else (
    echo "React build folder not found."
)
