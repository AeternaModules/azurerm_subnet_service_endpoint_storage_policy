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
      service           = optional(string) # Default: "Microsoft.Storage"
      service_resources = set(string)
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.subnet_service_endpoint_storage_policies : (
        v.definition == null || (length(v.definition) >= 1 && length(v.definition) <= 2)
      )
    ])
    error_message = "Each definition list must contain between 1 and 2 items"
  }
  # --- Unconfirmed validation candidates, derived from azurerm_subnet_service_endpoint_storage_policy's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    validate.SubnetServiceEndpointStoragePolicyName: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: location
  #   source:    location.EnhancedValidate: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: definition.name
  #   source:    validate.SubnetServiceEndpointStoragePolicyDefinitionName: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: definition.service_resources[*]
  #   source:    validation.Any(...) - no translation rule yet, add one
  # path: definition.description
  #   condition: length(value) >= 0 && length(value) <= 140
  #   message:   must be between 0 and 140 characters
  # path: definition.service
  #   condition: contains(["Microsoft.Storage", "Global"], value)
  #   message:   must be one of: Microsoft.Storage, Global
  # path: tags
  #   condition: length(value) <= 50
  #   message:   [from tags.Validate: invalid when len(value) > 50]
  #   source:    [from tags.Validate: invalid when len(value) > 50]
  # path: tags
  #   condition: length(value) <= 512
  #   message:   [from tags.Validate: invalid when len(value) > 512]
  #   source:    [from tags.Validate: invalid when len(value) > 512]
  # path: tags
  #   source:    [from tags.Validate] err != nil
  # path: tags
  #   condition: length(value) <= 256
  #   message:   [from tags.Validate: invalid when len(value) > 256]
  #   source:    [from tags.Validate: invalid when len(value) > 256]
}

