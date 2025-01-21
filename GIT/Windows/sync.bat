:: filepath: C:\Users\samsa\Sources\SimpleScript\GIT\Windows\sync.bat
@echo off

:: Fetch the latest changes from the remote repository
git fetch

:: Check if there are any changes between the local and remote repositories
for /f %%i in ('git rev-parse @') do set LOCAL=%%i
for /f %%i in ('git rev-parse @{u}') do set REMOTE=%%i

:: Check for uncommitted changes
git status --porcelain >nul 2>&1
if not errorlevel 1 (
    echo Uncommitted changes found. Adding and committing...
    git add .
    git commit -m "Sync /Media"
)

if not "%LOCAL%"=="%REMOTE%" (
    echo Local and remote repositories are different. Pushing changes...
    git push
) else (
    echo No changes to sync.
)