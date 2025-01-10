@echo off
setlocal enabledelayedexpansion

:: Set the base directory (current folder)
set "BaseDir=%cd%"

:: Create the organization folder
set "OrgFolder=%BaseDir%\Organized"
mkdir "%OrgFolder%" 2>nul

:: Loop through all files in the current folder and subfolders
for /R "%BaseDir%" %%f in (*) do (
    :: Skip if the file is inside the organization folder
    if not "%%~dpnxF"=="%OrgFolder%" (
        set "ext=%%~xf"
        set "ext=!ext:~1!"  :: Remove the dot from the extension

        :: Skip if the extension is empty
        if not "!ext!"=="" (
            :: Create a folder named after the extension inside the organization folder (if not exists)
            mkdir "%OrgFolder%\!ext!" 2>nul

            :: Move the file to the corresponding folder
            move "%%f" "%OrgFolder%\!ext!\" >nul
        )
    )
)

:: Completion message
echo All files have been organized into the "Organized" folder.
pause
