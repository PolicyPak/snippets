# Set Launch Folder Windows in a Separate Process to Enabled
if((Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced") -ne $true) {
	New-Item "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -force -ea SilentlyContinue 
};

New-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'SeparateProcess' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue; 
