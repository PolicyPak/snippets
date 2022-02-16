$users = Get-ChildItem C:\Users
foreach ($user in $users){$folder = "$($user.fullname)\AppData\Local\Google\Chrome\User Data\Default\Extensions\fmbfiodledfjldlhiemaadmgppoeklbn"
If (Test-Path $folder) {Remove-Item $folder -Recurse -Force -ErrorAction silentlycontinue } } 
