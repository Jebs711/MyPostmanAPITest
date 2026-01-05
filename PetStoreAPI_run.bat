@echo off
setlocal

REM Get timestamp using PowerShell (no WMIC, no delayed expansion)
for /f %%i in ('powershell -command "Get-Date -Format yyyyMMdd_HHmmss"') do set ts=%%i

echo Running Newman with timestamp: %ts%

REM Run Newman
newman run PetStoreAPIs.postman_collection.json -e Swagger_PetStore.postman_environment.json -r htmlextra ^
--reporter-htmlextra-export "C:\Users\Public\Documents\API_Results\SwaggerPetStoreAPIs\PetStore_API_Report_%ts%.html" ^
--reporter-htmlextra-browserTitle "API Test Report" ^
--reporter-htmlextra-title "PetStoreAPIs Test Result" ^
--reporter-htmlextra-titleSize 3 ^
--reporter-htmlextra-logs ^
--suppress-exit-code

