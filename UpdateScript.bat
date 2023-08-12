@echo off
timeout /t 1

setlocal

set "currentDirectory=%~dp0"
set "updateFolderPath=%currentDirectory%Debug\LauncherUpdate\ASK-main"
set "debugFolderPath=%currentDirectory%Debug"

for %%I in ("%updateFolderPath%\*") do (
    set "destinationPath=%debugFolderPath%\%%~nxI"
    copy /y "%%I" "!destinationPath!"
)

start "" "%debugFolderPath%\ASKLauncher.exe"

endlocal