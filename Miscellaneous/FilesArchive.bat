@echo off
REM Compress-Archive Script Example for All Users

REM Define paths to the files to be compressed
REM Add file paths as needed
set "file1=C:\Users\prins\Downloads\favicon.svg"
set "file2=C:\Users\prins\Downloads\blog-01-11-2025.xml"
set "file3=C:\Users\prins\Downloads\material-buttons.html"
REM You can add more files here, e.g., set "file4=..."

REM Define the output path for the ZIP file
set "destination=C:\Users\prins\Downloads\source_files.zip"

REM Check if destination file already exists and delete it to avoid conflicts
if exist "%destination%" del /f "%destination%"

REM Build a PowerShell-friendly path list
set "files=%file1%,%file2%,%file3%"
REM Add more files here if necessary, e.g., %file4%, ...

REM Use PowerShell's Compress-Archive command to create the ZIP file
powershell -NoProfile -Command ^
    "Compress-Archive -Path %files% -DestinationPath '%destination%' -Force"

REM Notify the user about the result
if exist "%destination%" (
    echo Files have been successfully compressed into: %destination%
) else (
    echo Compression failed. Please check file paths and permissions.
)

REM Pause to display the message before closing the terminal
pause
