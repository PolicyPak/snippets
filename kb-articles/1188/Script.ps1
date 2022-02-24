
$path = "$env:LOCALAPPDATA\temp\1stlogon.flg"
$logfile = "$env:LOCALAPPDATA\temp\1stlogon.log"

# TIMESTAMP FUNCTION: Usage: Write-Output "$(Get-TimeStamp) Text goes here" | Out-file C:\log.txt -append
function Get-TimeStamp {
  return "[{0:MM/dd/yyyy} {0:HH:mm:ss}]" -f (Get-Date)
}

if(!(Test-Path -Path $path))
{
    New-Item -Path "$env:LOCALAPPDATA\temp\1stlogon.flg"
    Write-Output "$(Get-TimeStamp) Going to run Edge since this is the 1st logon."| Out-file $logfile -append
    start msedge 
}
else
{
 Write-Output "$(Get-TimeStamp) Script has been already applied. Skipping." | Out-file $logfile -append  
}