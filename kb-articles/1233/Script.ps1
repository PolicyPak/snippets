$key = (1,2,3,4,5,1,2,3,4,5,11,12,13,14,15,20,30,40,50,5,4,3,2,1)
$pwd = get-content \\server\share\file.txt | convertto-securestring -key $key
$user = “EastSalesUser1”
$cred = new-object -typename System.Management.Automation.PSCredential -argumentlist $user,$pwd
$pw = $cred.GetNetworkCredential().Password
$cmd = “net user $user $pw”
Invoke-Expression $cmd