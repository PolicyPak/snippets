# Hides the blue PowerShell window UI when running PS scripts interactively

Add-Type -Name Window -Namespace Console -MemberDefinition '

[DllImport("Kernel32.dll")]
public static extern IntPtr GetConsoleWindow();

[DllImport("user32.dll")]
public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);
'
[Console.Window]::ShowWindow([Console.Window]::GetConsoleWindow(), 0)

# Segment of Script below is from https://www.alkanesolutions.co.uk/2021/01/16/launch-microsoft-teams-minimised-in-the-system-tray/

Try
 {
 #Terminate Teams if it is running
 $teamsProcess = Get-Process Teams -ErrorAction SilentlyContinue
If ($teamsProcess)
     {
     #Close Teams Window
  	 $teamsProcess.CloseMainWindow() | Out-Null
	 Start-Sleep -s 5
	 #Close Teams 
	 Stop-Process -Name "Teams" -Force -ErrorAction SilentlyContinue
     }

#Define Teams Update.exe paths      
$userTeams = [System.IO.Path]::Combine("$env:LOCALAPPDATA", "Microsoft", "Teams", "current", "Teams.exe")
$machineTeamsX86 = [System.IO.Path]::Combine("$env:PROGRAMFILES (X86)", "Microsoft", "Teams", "current", "Teams.exe")
$machineTeamsX64 = [System.IO.Path]::Combine("$env:PROGRAMFILES", "Microsoft", "Teams", "current", "Teams.exe")
     
#Define arguments
$args = @("-process-start-args","""--system-initiated""")

#Launch Teams
if (Test-Path -Path $userTeams)
 {Start-Process -FilePath $userTeams -ArgumentList $args}
Elseif (Test-Path -Path $machineTeamsX86)
 {Start-Process -FilePath $machineTeamsX86 -ArgumentList $args}
Elseif (Test-Path -Path $machineTeamsX64)
 {Start-Process -FilePath $machineTeamsX64 -ArgumentList $args}

} catch {
        #do something
        #$_.Exception
}