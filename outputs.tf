output "subnet_service_endpoint_storage_policies_id" {
  description = "Map of id values across all subnet_service_endpoint_storage_policies, keyed the same as var.subnet_service_endpoint_storage_policies"
  value       = { for k, v in azurerm_subnet_service_endpoint_storage_policy.subnet_service_endpoint_storage_policies : k => v.id if v.id != null && length(v.id) > 0 }
}
output "subnet_service_endpoint_storage_policies_definition" {
  description = "Map of definition values across all subnet_service_endpoint_storage_policies, keyed the same as var.subnet_service_endpoint_storage_policies"
  value       = { for k, v in azurerm_subnet_service_endpoint_storage_policy.subnet_service_endpoint_storage_policies : k => v.definition if v.definition != null && length(v.definition) > 0 }
}
output "subnet_service_endpoint_storage_policies_location" {
  description = "Map of location values across all subnet_service_endpoint_storage_policies, keyed the same as var.subnet_service_endpoint_storage_policies"
  value       = { for k, v in azurerm_subnet_service_endpoint_storage_policy.subnet_service_endpoint_storage_policies : k => v.location if v.location != null && length(v.location) > 0 }
}
output "subnet_service_endpoint_storage_policies_name" {
  description = "Map of name values across all subnet_service_endpoint_storage_policies, keyed the same as var.subnet_service_endpoint_storage_policies"
  value       = { for k, v in azurerm_subnet_service_endpoint_storage_policy.subnet_service_endpoint_storage_policies : k => v.name if v.name != null && length(v.name) > 0 }
}
output "subnet_service_endpoint_storage_policies_resource_group_name" {
  description = "Map of resource_group_name values across all subnet_service_endpoint_storage_policies, keyed the same as var.subnet_service_endpoint_storage_policies"
  value       = { for k, v in azurerm_subnet_service_endpoint_storage_policy.subnet_service_endpoint_storage_policies : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "subnet_service_endpoint_storage_policies_tags" {
  description = "Map of tags values across all subnet_service_endpoint_storage_policies, keyed the same as var.subnet_service_endpoint_storage_policies"
  value       = { for k, v in azurerm_subnet_service_endpoint_storage_policy.subnet_service_endpoint_storage_policies : k => v.tags if v.tags != null && length(v.tags) > 0 }
}

