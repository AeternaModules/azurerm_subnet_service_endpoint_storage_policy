output "subnet_service_endpoint_storage_policies_definition" {
  description = "Map of definition values across all subnet_service_endpoint_storage_policies, keyed the same as var.subnet_service_endpoint_storage_policies"
  value       = { for k, v in azurerm_subnet_service_endpoint_storage_policy.subnet_service_endpoint_storage_policies : k => v.definition }
}
output "subnet_service_endpoint_storage_policies_location" {
  description = "Map of location values across all subnet_service_endpoint_storage_policies, keyed the same as var.subnet_service_endpoint_storage_policies"
  value       = { for k, v in azurerm_subnet_service_endpoint_storage_policy.subnet_service_endpoint_storage_policies : k => v.location }
}
output "subnet_service_endpoint_storage_policies_name" {
  description = "Map of name values across all subnet_service_endpoint_storage_policies, keyed the same as var.subnet_service_endpoint_storage_policies"
  value       = { for k, v in azurerm_subnet_service_endpoint_storage_policy.subnet_service_endpoint_storage_policies : k => v.name }
}
output "subnet_service_endpoint_storage_policies_resource_group_name" {
  description = "Map of resource_group_name values across all subnet_service_endpoint_storage_policies, keyed the same as var.subnet_service_endpoint_storage_policies"
  value       = { for k, v in azurerm_subnet_service_endpoint_storage_policy.subnet_service_endpoint_storage_policies : k => v.resource_group_name }
}
output "subnet_service_endpoint_storage_policies_tags" {
  description = "Map of tags values across all subnet_service_endpoint_storage_policies, keyed the same as var.subnet_service_endpoint_storage_policies"
  value       = { for k, v in azurerm_subnet_service_endpoint_storage_policy.subnet_service_endpoint_storage_policies : k => v.tags }
}

