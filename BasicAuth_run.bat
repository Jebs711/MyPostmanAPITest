@echo off
setlocal EnableDelayedExpansion

REM Get timestamp using PowerShell (WMIC-free)
for /f %%i in ('powershell -command "Get-Date -Format yyyyMMdd_HHmmss"') do set ts=%%i

echo Running Newman with timestamp: !ts!

REM Run Newman
newman run BasicAuth_Razorpay.postman_collection.json -r htmlextra ^
--reporter-htmlextra-export C:\Users\Public\Documents\API_Results\BasicAuthAPIs\BasicAuthAPI_Report_!ts!.html ^
--reporter-htmlextra-browserTitle "API Test Report" ^
--reporter-htmlextra-title "BasicAuthAPIs Test Result" ^
--reporter-htmlextra-titleSize 3 ^
--reporter-htmlextra-logs ^
--suppress-exit-code