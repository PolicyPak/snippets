$svcKaseya = (Get-Service -DisplayName "Kaseya Agent" | Select -Property Name).Name
& cmd /c sc config $svcKaseya depend= /
