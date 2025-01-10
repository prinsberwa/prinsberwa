@echo off
REM Compress-Archive Script Example for All Users

REM Define paths to the files to be compressed.
REM Replace "C:\path\to\file" with your actual file paths.
set file1=C:\path\to\filename.extention
set file2=C:\path\to\filename.extention
set file3=C:\path\to\filename.extention
REM You can add more file paths like file4, file5 and more

REM Define the output path for the ZIP file.
REM Replace "C:\path\to\output" with your desired destination folder.
set destination=C:\path\to\output\source_files.zip

REM Use PowerShell's Compress-Archive command to create a ZIP file.
powershell -Command "Compress-Archive -Path '%file1%', '%file2%', '%file3%', '%file4%', '%file5%', '%file6%', '%file7%', '%file8%', '%file9%' -DestinationPath '%destination%'"

REM Notify the user about the completion.
echo Files have been successfully compressed into: %destination%

REM Pause to display the message before closing the terminal.
pause
