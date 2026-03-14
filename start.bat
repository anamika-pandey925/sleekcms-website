@echo off
title SleekCMS — Dev Server
color 0A

echo.
echo  ====================================
echo    SleekCMS — Starting Dev Server
echo  ====================================
echo.

:: Check if Node.js is installed
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo  [ERROR] Node.js is not installed!
    echo  Download it from: https://nodejs.org
    echo.
    pause
    exit /b 1
)

:: Install dependencies if node_modules is missing
if not exist "node_modules\" (
    echo  [INFO] node_modules not found. Installing dependencies...
    echo  This may take a minute on first run.
    echo.
    npm install
    if %errorlevel% neq 0 (
        echo.
        echo  [ERROR] npm install failed. Check your internet connection.
        pause
        exit /b 1
    )
    echo.
    echo  [OK] Dependencies installed successfully.
    echo.
)

:: Wait 2 seconds then open browser (runs in background)
echo  [INFO] Opening browser in 3 seconds...
start /b cmd /c "timeout /t 3 /nobreak >nul && start http://localhost:5173"

:: Start the Vite dev server (blocks until Ctrl+C)
echo  [INFO] Starting Vite dev server...
echo  [INFO] Press Ctrl+C to stop the server.
echo.
npm run dev

:: If the server stops, pause so the window doesn't close instantly
echo.
echo  Server stopped. Press any key to close.
pause >nul
