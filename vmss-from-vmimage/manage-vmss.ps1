# List VM Scale Sets  
Get-AzureRmVmss | select *


# Install Antimalware on VMSS

$rgname = 'DEMO-VMSS'
$vmssname = 'demovmss'
$location = 'westeurope'
# Retrieve the most recent version number of the extension.
$allVersions= (Get-AzureRmVMExtensionImage -Location $location -PublisherName "Microsoft.Azure.Security" -Type "IaaSAntimalware").Version
$versionString = $allVersions[($allVersions.count)-1].Split(".")[0] + "." + $allVersions[($allVersions.count)-1].Split(".")[1]
$VMSS = Get-AzureRmVmss -ResourceGroupName $rgname -VMScaleSetName $vmssname
echo $VMSS
Add-AzureRmVmssExtension -VirtualMachineScaleSet $VMSS -Name "IaaSAntimalware" -Publisher "Microsoft.Azure.Security" -Type "IaaSAntimalware" -TypeHandlerVersion $versionString
Update-AzureRmVmss -ResourceGroupName $rgname -Name $vmssname -VirtualMachineScaleSet $VMSS 

# List scale set profiles and config
Get-AzureRmVmss -Name demovmss -ResourceGroupName demo-vmss



# Auto Upgrade 

# Register to use Automatic OS upgrade
Register-AzureRmProviderFeature -ProviderNamespace Microsoft.Compute -FeatureName AutoOSUpgradePreview
# Check registered feature 
Get-AzureRmProviderFeature

Register-AzureRmResourceProvider -ProviderNamespace Microsoft.Compute
# Check registered provider 
Get-AzureRmResourceProvider 