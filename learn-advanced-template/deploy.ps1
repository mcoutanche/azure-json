$templateFile = "C:\Users\Michael.Coutanche\OneDrive\GitHub\azure-json\learn-advanced-template\azuredeploy.json"
$parameterFile="C:\Users\Michael.Coutanche\OneDrive\GitHub\azure-json\learn-advanced-template\azuredeploy.parameters.prod.json"
# $parameterFile="C:\Users\Michael.Coutanche\OneDrive\GitHub\azure-json\learn-advanced-template\azuredeploy.parameters.uat.json"

$resourceGroupName = Read-Host -Prompt "Enter a deployment target resource group:"

# New-AzResourceGroup `
# -Name resource-group-name `
# -Location "UK South"

New-AzResourceGroupDeployment `
  -Name learndeploy `
  -ResourceGroupName $resourceGroupName `
  -TemplateFile $templateFile `
  -TemplateParameterFile $parameterFile