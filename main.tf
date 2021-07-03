# creates a new key-vault and associated resource group
resource "azurerm_resource_group" "vault" {
  name     = var.resource_group
  location = var.location
}

# Create the key vault
resource "azurerm_key_vault" "vault" {
  name                       = var.name
  location                   = azurerm_resource_group.vault.location
  resource_group_name        = azurerm_resource_group.vault.name
  tenant_id                  = var.tenant_id
  soft_delete_retention_days = 7
  sku_name                   = "standard"

  tags = merge(
    var.common_tags,
    tomap(
      {"Component" = "Key Vault"}
    )
  )
}

# Create the access policies
resource "azurerm_key_vault_access_policy" "vault" {
  for_each = var.access_policies
  key_vault_id = azurerm_key_vault.vault.id
  tenant_id    = var.tenant_id

  object_id    = each.value.object_id

  key_permissions = each.value.keys
  secret_permissions = each.value.secrets
  
  tags = merge(
    var.common_tags,
    tomap(
      {"Component" = "Key Vault"}
    )
  )
}
