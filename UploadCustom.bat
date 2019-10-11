@setlocal enableextensions enabledelayedexpansion
@echo off
set "dashboardkey="
set "tenant="
set "posnum="
set "dashboardname="
set "dashboardid="
set /a "line = 0"
REM Gather environment details
set "dashboardkey=%2"
if not defined dashboardkey set /p dashboardkey="Enter Custom Dashboard Key: "
set "overviewkey=%3"
if not defined overviewkey set /p overviewkey="Enter Overview Dashboard Key: "
set "posnum=%4"
if not defined posnum set /p posnum="Enter Position (2-11): "
if exist ./\%overviewkey%.cfg (
for /f "tokens=*" %%a in (./\%overviewkey%.cfg) do (
    set /a "line = line + 1"
    if !line!==1 set tenant=%%a
)
)
set /a "line = 0"
if exist ./\%dashboardkey%.cfg (
for /f "tokens=*" %%a in (./\%dashboardkey%.cfg) do (
    set /a "line = line + 1"
    if !line!==1 set dashboardname=%%a
    if !line!==2 set dashboardid=%%a
)
)
REM Get App Overview Dashboard
curl -X GET "https://%tenant%/api/config/v1/dashboards/fbe8d3b1-ccb9-480c-9e5d-0e1b8b4da%overviewkey%" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" > ./Transform/TempOverview.json
REM Update Overview Dashboard
if %posnum% EQU 2 (powershell -Command "Get-ChildItem -Path ./Transform\TempOverview.json -recurse | ForEach {If (Get-Content $_.FullName | Select-String -Pattern '2 Logs') {(Get-Content $_ | ForEach {$_ -replace '2 Logs', '!dashboardname! Overview'}) | Set-Content $_ -encoding UTF8}}"
powershell -Command "Get-ChildItem -Path ./Transform\TempOverview.json -recurse | ForEach {If (Get-Content $_.FullName | Select-String -Pattern 'logmonitoring') {(Get-Content $_ | ForEach {$_ -replace 'logmonitoring', 'dashboard;id=!dashboardid!'}) | Set-Content $_ -encoding UTF8}}")
if %posnum% EQU 3 (powershell -Command "Get-ChildItem -Path ./Transform\TempOverview.json -recurse | ForEach {If (Get-Content $_.FullName | Select-String -Pattern '3 Smartscape') {(Get-Content $_ | ForEach {$_ -replace '3 Smartscape', '!dashboardname!'}) | Set-Content $_ -encoding UTF8}}"
powershell -Command "Get-ChildItem -Path ./Transform\TempOverview.json -recurse | ForEach {If (Get-Content $_.FullName | Select-String -Pattern 'smartscape') {(Get-Content $_ | ForEach {$_ -replace 'smartscape', 'dashboard;id=!dashboardid!'}) | Set-Content $_ -encoding UTF8}}")
if %posnum% EQU 4 (powershell -Command "Get-ChildItem -Path ./Transform\TempOverview.json -recurse | ForEach {If (Get-Content $_.FullName | Select-String -Pattern '4 Diagnostics') {(Get-Content $_ | ForEach {$_ -replace '4 Diagnostics', '!dashboardname!'}) | Set-Content $_ -encoding UTF8}}"
powershell -Command "Get-ChildItem -Path ./Transform\TempOverview.json -recurse | ForEach {If (Get-Content $_.FullName | Select-String -Pattern 'diagnostictools') {(Get-Content $_ | ForEach {$_ -replace 'diagnostictools', 'dashboard;id=!dashboardid!'}) | Set-Content $_ -encoding UTF8}}")
if %posnum% EQU 5 (powershell -Command "Get-ChildItem -Path ./Transform\TempOverview.json -recurse | ForEach {If (Get-Content $_.FullName | Select-String -Pattern '5 Services') {(Get-Content $_ | ForEach {$_ -replace '5 Services', '!dashboardname!'}) | Set-Content $_ -encoding UTF8}}"
powershell -Command "Get-ChildItem -Path ./Transform\TempOverview.json -recurse | ForEach {If (Get-Content $_.FullName | Select-String -Pattern 'newservices') {(Get-Content $_ | ForEach {$_ -replace 'newservices', 'dashboard;id=!dashboardid!'}) | Set-Content $_ -encoding UTF8}}")
if %posnum% EQU 6 (powershell -Command "Get-ChildItem -Path ./Transform\TempOverview.json -recurse | ForEach {If (Get-Content $_.FullName | Select-String -Pattern '6 Databases') {(Get-Content $_ | ForEach {$_ -replace '6 Databases', '!dashboardname!'}) | Set-Content $_ -encoding UTF8}}"
powershell -Command "Get-ChildItem -Path ./Transform\TempOverview.json -recurse | ForEach {If (Get-Content $_.FullName | Select-String -Pattern 'newdatabases') {(Get-Content $_ | ForEach {$_ -replace 'newdatabases', 'dashboard;id=!dashboardid!'}) | Set-Content $_ -encoding UTF8}}")
if %posnum% EQU 7 (powershell -Command "Get-ChildItem -Path ./Transform\TempOverview.json -recurse | ForEach {If (Get-Content $_.FullName | Select-String -Pattern '7 Hosts') {(Get-Content $_ | ForEach {$_ -replace '7 Hosts', '!dashboardname!'}) | Set-Content $_ -encoding UTF8}}"
powershell -Command "Get-ChildItem -Path ./Transform\TempOverview.json -recurse | ForEach {If (Get-Content $_.FullName | Select-String -Pattern 'newhosts') {(Get-Content $_ | ForEach {$_ -replace 'newhosts', 'dashboard;id=!dashboardid!'}) | Set-Content $_ -encoding UTF8}}")
if %posnum% EQU 8 (powershell -Command "Get-ChildItem -Path ./Transform\TempOverview.json -recurse | ForEach {If (Get-Content $_.FullName | Select-String -Pattern '8 Technologies') {(Get-Content $_ | ForEach {$_ -replace '8 Technologies', '!dashboardname!'}) | Set-Content $_ -encoding UTF8}}"
powershell -Command "Get-ChildItem -Path ./Transform\TempOverview.json -recurse | ForEach {If (Get-Content $_.FullName | Select-String -Pattern 'newprocessessummary') {(Get-Content $_ | ForEach {$_ -replace 'newprocessessummary', 'dashboard;id=!dashboardid!'}) | Set-Content $_ -encoding UTF8}}")
if %posnum% EQU 9 (powershell -Command "Get-ChildItem -Path ./Transform\TempOverview.json -recurse | ForEach {If (Get-Content $_.FullName | Select-String -Pattern '9 Deploy') {(Get-Content $_ | ForEach {$_ -replace '9 Deploy', '!dashboardname!'}) | Set-Content $_ -encoding UTF8}}"
powershell -Command "Get-ChildItem -Path ./Transform\TempOverview.json -recurse | ForEach {If (Get-Content $_.FullName | Select-String -Pattern 'deploy') {(Get-Content $_ | ForEach {$_ -replace 'deploy', 'dashboard;id=!dashboardid!'}) | Set-Content $_ -encoding UTF8}}")
if %posnum% EQU 10 (powershell -Command "Get-ChildItem -Path ./Transform\TempOverview.json -recurse | ForEach {If (Get-Content $_.FullName | Select-String -Pattern '10 Applications') {(Get-Content $_ | ForEach {$_ -replace '10 Applications', '!dashboardname!'}) | Set-Content $_ -encoding UTF8}}"
powershell -Command "Get-ChildItem -Path ./Transform\TempOverview.json -recurse | ForEach {If (Get-Content $_.FullName | Select-String -Pattern 'uemapplications') {(Get-Content $_ | ForEach {$_ -replace 'uemapplications', 'dashboard;id=!dashboardid!'}) | Set-Content $_ -encoding UTF8}}")
if %posnum% EQU 11 (powershell -Command "Get-ChildItem -Path ./Transform\TempOverview.json -recurse | ForEach {If (Get-Content $_.FullName | Select-String -Pattern '11 Sessions') {(Get-Content $_ | ForEach {$_ -replace '11 Sessions', '!dashboardname!'}) | Set-Content $_ -encoding UTF8}}"
powershell -Command "Get-ChildItem -Path ./Transform\TempOverview.json -recurse | ForEach {If (Get-Content $_.FullName | Select-String -Pattern 'usersearchoverview') {(Get-Content $_ | ForEach {$_ -replace 'usersearchoverview', 'dashboard;id=!dashboardid!'}) | Set-Content $_ -encoding UTF8}}")
REM Upload Overview Dashboard
curl -X PUT "https://%tenant%/api/config/v1/dashboards/fbe8d3b1-ccb9-480c-9e5d-0e1b8b4da%overviewkey%" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @./Transform\TempOverview.json
REM Get Key Store Dashboard
curl -X GET "https://%tenant%/api/config/v1/dashboards/d4db8e38-000f-42df-85a9-d491d34da000" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" > ./Transform/KeyStore.json
REM Update Key Store Dashboard
powershell -Command "Get-ChildItem -Path ./Transform/KeyStore.json -recurse | ForEach {If (Get-Content $_.FullName | Select-String -Pattern '##  ') {(Get-Content $_ | ForEach {$_ -replace '##  ', '## %dashboardkey% !dashboardname! Custom Dashboard Added to %overviewkey% at Position %posnum%\n##  '}) | Set-Content $_ -encoding UTF8}}"
REM Upload Key Store Dashboard
curl -X PUT "https://%tenant%/api/config/v1/dashboards/d4db8e38-000f-42df-85a9-d491d34da000" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token %1" -H "Content-Type: application/json; charset=utf-8" -d @./Transform\KeyStore.json
echo *********                           *********
echo ********* Custom Dashboard Deployed *********
echo *********                           *********
