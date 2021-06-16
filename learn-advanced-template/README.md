Learn project for ARM

Builds some stuff. (VM, VNET, NIC, PIP, StorageAccounts)

Pulls admin password from Key vault 
Uses copy loops


try looping pip based on array object - if not then loop linked templates for VMs


      "storageAccountCount": {
        "type": "int",
        "defaultValue": 5
      },


{
      "type": "Microsoft.Storage/storageAccounts",
      "name": "[concat(variables('storageAccountName'), copyIndex('storageAccountCopy', 1))]",
      "apiVersion": "2019-06-01",
      "location": "[parameters('location')]",
      "sku": {"name": "Standard_LRS"},
      "kind": "StorageV2",
      "tags": {
          "displayName": "[concat(variables('storageAccountName'), copyIndex('storageAccountCopy', 1))]"
      },
      "copy": {
        "name": "storageAccountCopy",
        "count": "[parameters('storageAccountCount')]"
      }
  },

