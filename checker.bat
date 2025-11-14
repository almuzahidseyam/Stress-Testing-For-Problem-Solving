@echo off
REM --- STEP 1: COMPILE ---
g++ -std=c++17 -O2 -o gen.exe gen.cpp
g++ -std=c++17 -O2 -o bruteforce.exe bruteforce.cpp
g++ -std=c++17 -O2 -o optimal.exe optimal.cpp

REM Stop if compilation fails.
IF %ERRORLEVEL% NEQ 0 (
    echo.
    echo --- Compilation Failed! ---
    pause
    exit /b
)

echo --- Compilation Successful. Starting tests... ---
set /a i=0

REM --- STEP 2: INFINITE TESTING LOOP ---
:test_loop
    set /a i+=1
    
    REM Generate input and run both solutions, saving their output to files.
    gen.exe > input.txt
    bruteforce.exe < input.txt > brute_output.txt
    optimal.exe < input.txt > optimal_output.txt

    REM Use 'fc' (File Compare) to check for differences. 
    REM >nul hides the output of the fc command itself.
    fc brute_output.txt optimal_output.txt > nul

    REM If %ERRORLEVEL% is 0, the files are identical.
    if %ERRORLEVEL% == 0 (
        echo Test Case #%i% PASSED
    ) else (
        echo ----------------------------------------
        echo FAILURE ON TEST CASE #%i%
        echo ----------------------------------------
        echo Input:
        type input.txt
        echo.
        echo Bruteforce Output:
        type brute_output.txt
        echo.
        echo Optimal Output:
        type optimal_output.txt
        echo.
        goto :end_loop
    )
    goto :test_loop

:end_loop
    REM Clean up the temporary files and pause to show the final result.
    del brute_output.txt
    del optimal_output.txt
    echo.
    echo Script finished.
    pause
