@echo off
call config.bat

REM Ensure we are in the correct directory for the server files
cd /d "%SERVER_PATH%"

REM Copy the entire server dist folder (which now includes React) to the final deployment folder
xcopy /E /I /Y "%SERVER_DIST_PATH%" "%DEPLOY_PATH%/"

REM Copy additional files like .env and package.json
copy /Y "%SERVER_PATH%/.env" "%DEPLOY_PATH%/.env"
copy /Y "%SERVER_PATH%/package.json" "%DEPLOY_PATH%/package.json"

REM Create a .gitignore file in the build folder to exclude node_modules and other unnecessary files
echo node_modules/ > "%DEPLOY_PATH%/.gitignore"
echo .env >> "%DEPLOY_PATH%/.gitignore"
echo npm-debug.log >> "%DEPLOY_PATH%/.gitignore"
echo yarn-error.log >> "%DEPLOY_PATH%/.gitignore"

echo Deployment files copied successfully.
