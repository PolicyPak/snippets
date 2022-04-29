# Microsoft MSU will be coming from = https://z_deleteme.s3.amazonaws.com/windows6.1-kb3140245-x64_5b067ffb69a94a6e5f9da89ce88c658e52a0dec0.msu

#Script starts here

Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force

# Set Download variables

$DownloadFolder = "c:\temp\apps"

$DownloadURL = "https://z_deleteme.s3.amazonaws.com/windows6.1-kb3140245-x64_5b067ffb69a94a6e5f9da89ce88c658e52a0dec0.msu"

$LocalDownloadFile = "c:\temp\apps\kb3140245-x64.msu"

#Create temp folder if not present

$tempfolder = "C:\temp"

if (-not (Test-Path $tempfolder -PathType Container))

{

New-Item -ItemType directory -Path $tempfolder

}

# Create apps folder and enable logging

New-Item -ItemType directory -Path $DownloadFolder

start-transcript -path "c:\temp\apps\kb3140245-x64_PS.log" -append

# Download and install kb3140245-x64.msu

If ((Test-Path $LocalDownloadFile -PathType Leaf) -eq $False)

{

Invoke-WebRequest -Uri $DownloadURL -OutFile $LocalDownloadFile

#install kb3140245-x64.msu silently and enable verbose logging

wusa.exe c:\temp\apps\kb3140245-x64.msu /quiet /norestart /log:c:\temp\apps\kb3140245-x64_MSU.log

}

#Script ends here