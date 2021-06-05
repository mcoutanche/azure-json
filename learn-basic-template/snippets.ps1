# Sign in to Azure
Connect-AzAccount

# Sign into specific tenancy 
Connect-AzAccount -TenantId 704b93cf-c977-4698-ba7e-3b1b8aa09cb1

# Select subscription 
Select-AzSubscription -Subscription 06f4a48d-f71c-4bd4-8883-524876d25a2c

# Deploy ARM template with passing in seperate parameters 
$templateFile = "C:\Users\Michael.Coutanche\OneDrive\GitHub\azure-learn\json\basic-template\azuredeploy.json"
  New-AzResourceGroup `
  -Name CANCOMUKDEMO-MDC-ARMDEMO `
  -Location "UK South"
  New-AzResourceGroupDeployment `
  -Name ARMDemoTemplate `
  -ResourceGroupName CANCOMUKDEMO-MDC-ARMDEMO `
  -TemplateFile $templateFile `
  -storagePrefix "cancomuk" `
  -storageSKU Standard_LRS `
  -webAppName demoapp

# Deploy ARM template passing parameters file
$templateFile = "{path-to-the-template-file}"
$parameterFile="{path-to-azuredeploy.parameters.dev.json}"
New-AzResourceGroup `
-Name CANCOMUKDEMO-MDC-ARMDEMO `
-Location "UK South"
New-AzResourceGroupDeployment `
  -Name devenvironment `
  -ResourceGroupName myResourceGroupDev `
  -TemplateFile $templateFile `
  -TemplateParameterFile $parameterFile