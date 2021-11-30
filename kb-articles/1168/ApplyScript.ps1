$svcKaseya = (Get-Service -DisplayName "Kaseya Agent" | Select -Property Name).Name
$svcPPHelper = "PPExtensionSvc*"
$svcPPWatcher = "PPWatcherSvc*"
if ($svc = @(get-service $svcKaseya -ea 0)) {
# if Kaseya Service has no dependents currently
if (-not $svc.ServicesDependedOn) {
# Build the list of PolicyPak service names
$svcListPP = @()
if ($svc = @(get-service $svcPPHelper -ea 0)) {
foreach ($s in $svc.Name) {
$svcListPP += $s
}
}
if ($svc = @(get-service $svcPPWatcher -ea 0)) {
foreach ($s in $svc.Name) {
$svcListPP += $s
}
}
$svcListPP = $svcListPP -join "/"

# Set the Kaseya service to depend on the PolicyPak services
& cmd /c sc config $svcKaseya depend= $svcListPP
# Restart the kaseya agent service
Restart-Service $svcKaseya

}
}
