variable "subnet_service_endpoint_storage_policys" {
  description = <<EOT
Map of subnet_service_endpoint_storage_policys, attributes below
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
      service           = optional(string, "Microsoft.Storage")
      service_resources = set(string)
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.subnet_service_endpoint_storage_policys : (
        v.definition == null || (length(v.definition) >= 1 && length(v.definition) <= 2)
      )
    ])
    error_message = "Each definition list must contain between 1 and 2 items"
  }
}

