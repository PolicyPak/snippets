#Download the latest PPBR extension from shareFile/PolicyPak Support - Inbox/ppbr_crx/ppbr_21_2_0_0.crx 
$url = "https://policypak.sharefile.com/d-sb40ca79b2ea646f08a90e860c4ef79c2"

#Path of the downloaded CRX file at the client-machines
New-Item -ItemType directory -Path C:\Temp\ppbr_ext\ -ErrorAction SilentlyContinue | foreach-object { if ($_ -notmatch "already exists") { write-error $_ } }
$output = "C:\Temp\ppbr_ext\ppbr_21_2_0_0.crx"
$start_time = Get-Date
#Copy-Item "C:\realFolder\*" "C:\realFolder_new" -recurse -ErrorVariable capturedErrors -ErrorAction SilentlyContinue
#$capturedErrors | foreach-object { if ($_ -notmatch "already exists") { write-error $_ } }

#Setting a registry path when Windows OS version is 32-bit.
$registryPathx86 = "HKLM:\Software\Microsoft\Edge\Extensions\fmbfiodledfjldlhiemaadmgppoeklbn"

#Setting a registry path when Windows OS version is 64-Bit.
$registryPathx64 = "HKLM:\Software\Wow6432Node\Microsoft\Edge\Extensions\fmbfiodledfjldlhiemaadmgppoeklbn"

#PPBR Extension version. 
$version = "21.2.0.0"
$valueEXT = "https://clients2.google.com/service/update2/crx"

#Importing module for file transfer from the web.
Import-Module BitsTransfer
Start-BitsTransfer -Source $url -Destination $output
#OR
Start-BitsTransfer -Source $url -Destination $output -Asynchronous

Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"

#Detecing a Windows OS versin on the host machine.
gwmi win32_operatingsystem | select osarchitecture
if ((gwmi win32_operatingsystem | select osarchitecture).osarchitecture -eq "64-bit")
{
    #64-bit support
    #New-ItemProperty -Path $registryPathx64 -Name $name -Value $output `
    #-PropertyType String -Force | Out-Null
    
    New-Item -Path $registryPathx64 -Force | Out-Null
    New-ItemProperty -Path $registryPathx64 -Name Path -Value $output `
    -PropertyType String -Force | Out-Null

    New-ItemProperty -Path $registryPathx64 -Name Version -Value $version `
    -PropertyType String -Force | Out-Null

    New-ItemProperty -Path $registryPathx64 -Name update_URL -Value $valueEXT `
    -PropertyType String -Force | Out-Null

    }
   
else
{
    #32-bit support
    #New-ItemProperty -Path $registryPathx86 -Name $name -Value $output `
    #-PropertyType String -Force | Out-Null

    New-Item -Path $registryPathx86 -Force | Out-Null
    New-ItemProperty -Path $registryPathx86 -Name Path -Value $output `
    -PropertyType String -Force | Out-Null

     New-ItemProperty -Path $registryPathx86 -Name Version -Value $version `
    -PropertyType String -Force | Out-Null

     New-ItemProperty -Path $registryPathx86 -Name update_URL -Value $valueEXT `
    -PropertyType String -Force | Out-Null

    }   
