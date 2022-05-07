
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

Install-PackageProvider -Name NuGet -Scope CurrentUser -Force

Install-Module -Name Microsoft.Graph.Intune -Repository PSGallery -Scope CurrentUser -Force

Connect-MSGraph -AdminConsent

Get-Organization | Select @{N = 'CompanyName'; E = { $_.displayName } } | out-file INTUNECOMPANYNAME.TXT