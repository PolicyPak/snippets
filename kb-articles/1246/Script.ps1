# Get Service Principal using objectId 
$sp = Get-AzureADServicePrincipal -ObjectId "d240f374-28e9-4275-8521-110ff55fb61c" 
 
# Get all delegated permissions for the service principal 
$spOAuth2PermissionsGrants = Get-AzureADOAuth2PermissionGrant -All $true| Where-Object { $_.clientId -eq $sp.ObjectId } 
 
# Remove all delegated permissions 
$spOAuth2PermissionsGrants | ForEach-Object { 
    Remove-AzureADOAuth2PermissionGrant -ObjectId $_.ObjectId 
}
 
# Get all application permissions for the service principal 
$spApplicationPermissions = Get-AzureADServiceAppRoleAssignedTo -ObjectId $sp.ObjectId -All $true | Where-Object { $_.PrincipalType -eq "ServicePrincipal" }
 
# Remove all delegated permissions 
$spApplicationPermissions | ForEach-Object { 
    Remove-AzureADServiceAppRoleAssignment -ObjectId $_.PrincipalId -AppRoleAssignmentId $_.objectId 
}
