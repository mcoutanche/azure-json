Deploys a VMSS from Marketplace SKU with a health probe enabled on the VMSS for auto OS upgrade

Needs to have the following registered:

Register-AzureRmProviderFeature -ProviderNamespace Microsoft.Network -FeatureName AllowVmssHealthProbe
Get-AzureRmProviderFeature

Register-AzureRmResourceProvider -ProviderNamespace Microsoft.Network
get-AzureRmResourceProvider