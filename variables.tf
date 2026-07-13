variable "subnet_service_endpoint_storage_policies" {
  description = <<EOT
Map of subnet_service_endpoint_storage_policies, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - tags
    - definition (block):
        - description (optional)
        - name (required)
        - service (optional)
        - service_resources (required)
EOT

  type = map(object({
    location            = string
    name                = string
    resource_group_name = string
    tags                = optional(map(string))
    definition = optional(list(object({
      description       = optional(string)
      name              = string
      service           = optional(string)
      service_resources = set(string)
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.subnet_service_endpoint_storage_policies : (
        v.definition == null || (length(v.definition) <= 2)
      )
    ])
    error_message = "Each definition list must contain at most 2 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.subnet_service_endpoint_storage_policies : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.subnet_service_endpoint_storage_policies : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.subnet_service_endpoint_storage_policies : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.subnet_service_endpoint_storage_policies : (
        v.definition == null || alltrue([for item in v.definition : (item.description == null || (length(item.description) >= 0 && length(item.description) <= 140))])
      )
    ])
    error_message = "must be between 0 and 140 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.subnet_service_endpoint_storage_policies : (
        v.definition == null || alltrue([for item in v.definition : (item.service == null || (contains(["Microsoft.Storage", "Global"], item.service)))])
      )
    ])
    error_message = "must be one of: Microsoft.Storage, Global"
  }
  validation {
    condition = alltrue([
      for k, v in var.subnet_service_endpoint_storage_policies : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 8 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

