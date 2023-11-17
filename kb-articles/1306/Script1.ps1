$teamsPackages = get-appxpackage MSTeams -allusers
foreach ($p in $teamsPackages)
{
    Remove-AppPackage $p.PackageFullName -allusers
}