# Terraform-key-vault
Terraform module to create a key vault and manage access policies

# Usage
```hcl
module "key-vault" {
    source = "../../modules/Terraform-key-vault"

    resource_group = "testrg"
    location       = "UK South"
    name           = "yourkeyvaultname"
    tenant_id      = data.azurerm_client_config.current.tenant_id

    access_policies = {
      access1 = {
        object_id = "object id"
        keys = ["create", "delete", "get", "list","verify","sign"],
        secrets = ["set","get","list","delete"]

      }
      access2  = {
        object_id = "object id"
        keys = ["get","list"]
        secrets = ["set", "get", "list"]
      }
    }

    common_tags = {}
}
```

# Parameters

|Name|Type|Required|Description|
|---|---|---|---|
|location|string|True|The location where the key vault will be created|
|resource_group|string|True|The resource group that will be created to hold the key vault|
|name|string|True|The name of the key vault to be created|
|accesss_policies|map|True|A map containing the object_id, list of keys, and list of secrets to be granted|
|common_tags|map|True|A map of the tags to be assigned to the resources|

# Outputs

* **id** The id of the key vault that has been created
