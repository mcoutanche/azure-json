ARM Templates have three elements:

$schema:        Specifies the location of the JSON schema file. The schema file describes the properties that are available within a template. For example, the schema 
                defines resources as one of the valid properties for a template. Don't worry that the date for the schema is 2019-04-01. This schema version is up to date and includes all of the latest features. The schema date hasn't been changed because there have been no breaking changes since its introduction.

contentVersion: Specifies the version of the template (such as 1.0.0.0). You can provide any value for this element. Use this value to document significant changes in 
                your template. When deploying resources using the template, this value can be used to make sure that the right template is being used.

resources:      Contains the resources you want to deploy or update. Currently, it's empty, but you'll add resources later.

parameters      you can use to pass in name, config details about a service 
functions       auto adds location from resource group service being deployed [resourceGroup().location]
variables       variable to your template that creates a unique name 
outputs         use outputs to return values from the template. For example, it might be helpful to get the endpoints for your new storage account.

parameter files:

example: multipule files can be used to create differnet deployments from the same json temaplte file. 

dev             azuredeploy.parameters.dev.json
prod            azuredeploy.parameters.prod.json

If the deployment failed:

    -verbose    switch to get information about the resources being created. 
    -debug      switch to get more information for debugging.

Resource properties:

type:           Type of the resource. A combination of the namespace of the resource provider and the resource type such as Microsoft.Storage/storageAccounts.
apiVersion:     Version of the REST API to use for creating the resource. Each resource provider publishes its own API versions, so this value is specific to the type.
name:           Name of the resource.
