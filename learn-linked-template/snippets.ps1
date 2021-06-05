# Sign in to Azure
Connect-AzAccount

# Sign into specific tenancy 
Connect-AzAccount -TenantId 704b93cf-c977-4698-ba7e-3b1b8aa09cb1

# Select subscription 
Select-AzSubscription -Subscription 06f4a48d-f71c-4bd4-8883-524876d25a2c

# Deploy linked ARM templates from gitHub and push to storage account  
  $projectName = Read-Host -Prompt "Enter a project name:"   # This name is used to generate names for Azure resources, such as storage account name.
  $location = Read-Host -Prompt "Enter a location (i.e. centralus)"
  
  $resourceGroupName = $projectName + "rg"
  $storageAccountName = $projectName + "store"
  $containerName = "templates" # The name of the Blob container to be created.
  
  $mainTemplateURL = "https://raw.githubusercontent.com/mcoutanche/azure-json/master/learn-linked-template/azuredeploy.json"
  $linkedTemplateURL = "https://raw.githubusercontent.com/mcoutanche/azure-json/master/learn-linked-template/linkedStorageAccount.json"
  
  $mainFileName = "azuredeploy.json" # A file name used for downloading and uploading the main template.Add-PSSnapin
  $linkedFileName = "linkedStorageAccount.json" # A file name used for downloading and uploading the linked template.
  
  # Download the templates
  Invoke-WebRequest -Uri $mainTemplateURL -OutFile "C:\Users\Michael.Coutanche\OneDrive\GitHub\file-cache\$mainFileName"
  Invoke-WebRequest -Uri $linkedTemplateURL -OutFile "C:\Users\Michael.Coutanche\OneDrive\GitHub\file-cache\$linkedFileName"
  
  # Create a resource group
  New-AzResourceGroup -Name $resourceGroupName -Location $location
  
  # Create a storage account
  $storageAccount = New-AzStorageAccount `
      -ResourceGroupName $resourceGroupName `
      -Name $storageAccountName `
      -Location $location `
      -SkuName "Standard_LRS"
  
  $context = $storageAccount.Context
  
  # Create a container
  New-AzStorageContainer -Name $containerName -Context $context -Permission Container
  
  # Upload the templates
  Set-AzStorageBlobContent `
      -Container $containerName `
      -File "$home/$mainFileName" `
      -Blob $mainFileName `
      -Context $context
  
  Set-AzStorageBlobContent `
      -Container $containerName `
      -File "$home/$linkedFileName" `
      -Blob $linkedFileName `
      -Context $context
  
# Write-Host "Press [ENTER] to continue ..."

# deploy linked templates from storage account

# $projectName = Read-Host -Prompt "Enter the same project name:"   # This name is used to generate names for Azure resources, such as storage account name.

# $resourceGroupName="${projectName}rg"
# $storageAccountName="${projectName}store"
# $containerName = "templates"

$key = (Get-AzStorageAccountKey -ResourceGroupName $resourceGroupName -Name $storageAccountName).Value[0]
$context = New-AzStorageContext -StorageAccountName $storageAccountName -StorageAccountKey $key

$mainTemplateUri = $context.BlobEndPoint + "$containerName/azuredeploy.json"
$sasToken = New-AzStorageContainerSASToken `
    -Context $context `
    -Container $containerName `
    -Permission r `
    -ExpiryTime (Get-Date).AddHours(2.0)
$newSas = $sasToken.substring(1)


New-AzResourceGroupDeployment `
  -Name DeployLinkedTemplate `
  -ResourceGroupName $resourceGroupName `
  -TemplateUri $mainTemplateUri `
  -QueryString $newSas `
  -projectName $projectName `
  -verbose

Write-Host "Press [ENTER] to continue ..."