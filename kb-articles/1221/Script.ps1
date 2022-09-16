# Create task action
$taskAction = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument 'Restart-Computer -Force'
# Create a trigger (Daily at 9 AM)
$taskTrigger = New-ScheduledTaskTrigger -Daily -At 9am
# The user to run the task
$taskUser = New-ScheduledTaskPrincipal -UserID "NT AUTHORITY\SYSTEM" -LogonType ServiceAccount -RunLevel Highest
$settings = New-ScheduledTaskSettingsSet -MultipleInstances Parallel
# The name of the scheduled task.
$taskName = "Daily 9AM Reboot"
# Describe the scheduled task.
$description = "Forcibly reboot the computer at 9 AM Daily"
# Register the scheduled task
Register-ScheduledTask -TaskName $taskName -Action $taskAction -Trigger $taskTrigger -Settings $settings -Principal $taskUser -Description $description 
