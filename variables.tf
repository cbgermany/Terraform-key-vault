# Variables used by this module

variable "resource_group" {
    description = "Resource Group to hold the Key Vault"
    type        = string
}

variable "location" {
    description = "Location where the Key Vault will be created"
    type        = string
}

variable "name" {
    description = "The name of the key vault"
    type        = string
}

variable "tenant_id" {
    description = "The Tenant Id for the subscription"
    type        = string
}

# Map of the access policies
variable "access_policies" {
  description = "Map of access policies for the key vault"
  type = map(object({
    object_id = string
    keys      = list(string)
    secrets   = list(string)
  }))
  default = {}
}

variable "common_tags" {
  description = "A Map of common tags to assign to the key vault"
  type        = map(string)
}