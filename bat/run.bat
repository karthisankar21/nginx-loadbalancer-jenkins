@echo off
REM Nginx Load Balancer Pipeline Script
REM Usage: nginx_pipeline.bat start|test|clean

IF "%~1"=="" (
    echo Usage: %0 [start] [test] [clean]
    exit /b 1
)

:loop
IF "%~1"=="" GOTO end

SET arg=%~1

IF /I "%arg%"=="start" (
    echo === Starting Nginx Load Balancer ===
    REM --- Equivalent Docker commands ---
    docker-compose up --build -d
    echo Start complete!
    SHIFT
    GOTO loop
)

IF /I "%arg%"=="test" (
    echo === Testing Nginx Load Balancer ===
    REM --- Equivalent curl or test commands ---
    FOR /L %%i IN (1,1,5) DO (
        echo Request: %%i
        curl -s http://localhost:8002
        timeout /t 1
    )
    echo Test complete!
    SHIFT
    GOTO loop
)

IF /I "%arg%"=="clean" (
    echo === Cleaning Nginx Load Balancer ===
    docker-compose down
    echo Clean complete!
    SHIFT
    GOTO loop
)

echo Unknown option: %arg%
echo Valid options: start, test, clean
exit /b 1

:end
echo All selected steps completed!
