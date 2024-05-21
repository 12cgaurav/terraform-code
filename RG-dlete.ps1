# Get a list of all resource groups in the current subscription, output in json
$resourceGroups = az group list --output json | ConvertFrom-Json

# Iterate through each resource group
foreach ($rg in $resourceGroups) {
    # Confirmation to delete
    # $confirmation = Read-Host "Are you sure you want to delete the resource group '$($rg.name)'? (Y/N)"
    
        # Deleting the resource group
        az group delete --name $rg.name --yes --no-wait
        Write-Host "Deletion command issued for resource group '$($rg.name)'"
   
    }
Write-Host "All deletions processed."
