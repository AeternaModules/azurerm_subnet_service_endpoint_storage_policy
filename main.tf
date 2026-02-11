resource "azurerm_subnet_service_endpoint_storage_policy" "subnet_service_endpoint_storage_policies" {
  for_each = var.subnet_service_endpoint_storage_policies

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  tags                = each.value.tags

  dynamic "definition" {
    for_each = each.value.definition != null ? each.value.definition : []
    content {
      description       = definition.value.description
      name              = definition.value.name
      service           = definition.value.service
      service_resources = definition.value.service_resources
    }
  }
}

