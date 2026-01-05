@echo off
setlocal EnableDelayedExpansion

REM Get timestamp
for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /value') do set dt=%%I
set ts=!dt:~0,8!_!dt:~8,6!

echo Running Newman with timestamp: !ts!

REM Run Newman
newman run BasicAuth_Razorpay.postman_collection.json -r htmlextra ^
--reporter-htmlextra-export C:\Users\Public\Documents\API_Results\BasicAuthAPIs\BasicAuthAPI_Report_!ts!.html ^
--reporter-htmlextra-browserTitle "API Test Report" ^
--reporter-htmlextra-title "BasicAuthAPIs Test Result" ^
--reporter-htmlextra-titleSize 3 ^
--reporter-htmlextra-logs ^
--suppress-exit-code