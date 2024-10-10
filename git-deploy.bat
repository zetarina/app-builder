@echo off
call config.bat

REM Navigate to the deployment folder
cd /d "%DEPLOY_PATH%"

REM Check if .git exists; if not, initialize a new Git repository
if not exist ".git" (
    echo Initializing git repository...
    git init
    git remote add origin %GIT_REPO_URL%
)

REM Add all files and commit
git add .
git commit -m "Deploy dist folder"

REM Push to the pmx-release repository on GitHub
git push -u origin master --force

echo Git deployment to GitHub completed.
