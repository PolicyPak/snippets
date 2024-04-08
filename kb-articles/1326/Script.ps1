New-ItemProperty -Path “HKLM:\SYSTEM\CurrentControlSet\Services\UCPD” -Name “Start” -Value 4 -PropertyType DWORD -Force
Unregister-ScheduledTask -TaskName "UCPD velocity"
Unregister-ScheduledTask -TaskName "Pre-staged app cleanup"