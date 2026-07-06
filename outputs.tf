output "subnet_service_endpoint_storage_policies" {
  description = "All subnet_service_endpoint_storage_policy resources"
  value       = azurerm_subnet_service_endpoint_storage_policy.subnet_service_endpoint_storage_policies
}
output "subnet_service_endpoint_storage_policies_definition" {
  description = "List of definition values across all subnet_service_endpoint_storage_policies"
  value       = [for k, v in azurerm_subnet_service_endpoint_storage_policy.subnet_service_endpoint_storage_policies : v.definition]
}
output "subnet_service_endpoint_storage_policies_location" {
  description = "List of location values across all subnet_service_endpoint_storage_policies"
  value       = [for k, v in azurerm_subnet_service_endpoint_storage_policy.subnet_service_endpoint_storage_policies : v.location]
}
output "subnet_service_endpoint_storage_policies_name" {
  description = "List of name values across all subnet_service_endpoint_storage_policies"
  value       = [for k, v in azurerm_subnet_service_endpoint_storage_policy.subnet_service_endpoint_storage_policies : v.name]
}
output "subnet_service_endpoint_storage_policies_resource_group_name" {
  description = "List of resource_group_name values across all subnet_service_endpoint_storage_policies"
  value       = [for k, v in azurerm_subnet_service_endpoint_storage_policy.subnet_service_endpoint_storage_policies : v.resource_group_name]
}
output "subnet_service_endpoint_storage_policies_tags" {
  description = "List of tags values across all subnet_service_endpoint_storage_policies"
  value       = [for k, v in azurerm_subnet_service_endpoint_storage_policy.subnet_service_endpoint_storage_policies : v.tags]
}

