@echo off
echo Checking Node.js...

node -v >nul 2>&1
if %errorlevel% neq 0 (
    echo Node.js is not installed. Installing...
    bitsadmin /transfer "Téléchargement_NodeJS" https://nodejs.org/dist/v20.11.1/node-v20.11.1-x64.msi "%CD%\node_installer.msi"
    echo Node.js installation complete. Opening the installation file...
    start "" "%CD%\node_installer.msi"
) else (
    echo Node.js is already installed.
)

echo Exécution du script Node.js...
node checker.js
if %errorlevel% neq 0 (
    echo An error occurred while executing checker.js.
    pause
    exit /b %errorlevel%
) else (
    pause
)

pause
