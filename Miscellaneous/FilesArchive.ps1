$Files = @(
    "C:\Users\prins\Downloads\favicon.svg",
    "C:\Users\prins\Downloads\blog-01-11-2025.xml",
    "C:\Users\prins\Downloads\material-buttons.html"
)
$Destination = "C:\Users\prins\Downloads\source_files_185JK649GH35O78B24.zip"

# Remove existing ZIP if it exists
if (Test-Path $Destination) {
    Remove-Item -Path $Destination -Force
}

# Compress files
Compress-Archive -Path $Files -DestinationPath $Destination -Force

# Output success message
Write-Output "Files have been successfully compressed into: $Destination"
