@echo off
setlocal

REM Get timestamp using PowerShell (no WMIC, no delayed expansion)
for /f %%i in ('powershell -command "Get-Date -Format yyyyMMdd_HHmmss"') do set ts=%%i

echo Running Newman with timestamp: %ts%

REM Run Newman
newman run SampleAPIs.postman_collection.json ^
-d BulkUser_DataDrivenTest.csv -n 2 -r htmlextra ^
--reporter-htmlextra-export "C:\Users\Public\Documents\API_Results\SampleAPIs\SampleAPI_Report_%ts%.html" ^
--reporter-htmlextra-browserTitle "API Test Report" ^
--reporter-htmlextra-title "Sample APIs Test Result" ^
--reporter-htmlextra-titleSize 3 ^
--reporter-htmlextra-logs ^
--suppress-exit-code


REM Get timestamp using PowerShell (no WMIC, no delayed expansion)
for /f %%i in ('powershell -command "Get-Date -Format yyyyMMdd_HHmmss"') do set ts=%%i

echo Running Newman with timestamp: %ts%

REM Run Newman
newman run SampleAPIs.postman_collection.json ^
-d BulkUser_DataDrivenTest.json -n 2 -r htmlextra ^
--reporter-htmlextra-export "C:\Users\Public\Documents\API_Results\SampleAPIs\SampleAPI_Report_%ts%.html" ^
--reporter-htmlextra-browserTitle "API Test Report" ^
--reporter-htmlextra-title "Sample APIs Test Result" ^
--reporter-htmlextra-titleSize 3 ^
--reporter-htmlextra-logs ^
--suppress-exit-code