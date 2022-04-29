# Microsoft EasyFix will be coming from here: https://download.microsoft.com/download/0/6/5/0658B1A7-6D2E-474F-BC2C-D69E5B9E9A68/MicrosoftEasyFix51044.msi

#Script starts here

Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force

# Set Download variables

$DownloadFolder = "c:\temp\apps"

$DownloadURL = "https://download.microsoft.com/download/0/6/5/0658B1A7-6D2E-474F-BC2C-D69E5B9E9A68/MicrosoftEasyFix51044.msi"

$LocalDownloadFile = "c:\temp\apps\MicrosoftEasyFix51044.msi"

#Create temp folder if not present

$tempfolder = "C:\temp"

if (-not (Test-Path $tempfolder -PathType Container))

{

New-Item -ItemType directory -Path $tempfolder

}

# Create apps folder and enable logging

New-Item -ItemType directory -Path $DownloadFolder

start-transcript -path "c:\temp\apps\MicrosoftEasyFix51044.msi_PS.log" -append

# Download and install MSEasyFix

If ((Test-Path $LocalDownloadFile -PathType Leaf) -eq $False)

{

Invoke-WebRequest -Uri $DownloadURL -OutFile $LocalDownloadFile

#install MSEasyFix silently and enable verbose logging

msiexec.exe /i c:\temp\Apps\MicrosoftEasyFix51044.msi /qn /L*V C:\temp\apps\MSEasyFix_install.log

}

#Script ends here