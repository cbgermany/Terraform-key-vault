# Terraform-key-vault
Terraform module to create a key vault and manage access policies

# Usage

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
