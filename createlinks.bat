@echo off
set /p "path=Enter LocalMods directory:"
set "dir=%cd%"
pushd %path%
mklink /D oreostweaks %dir%\src
popd
pause