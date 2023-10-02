output "vnet" {
  description = "Virtual network"
  value       = azurerm_virtual_network.create_virtual_network
}

output "vnet_id" {
  description = "Virtual network ID"
  value       = azurerm_virtual_network.create_virtual_network.id
}

output "vnet_name" {
  description = "Virtual network name"
  value       = azurerm_virtual_network.create_virtual_network.name
}

output "vnet_location" {
  description = "Virtual network location"
  value       = azurerm_virtual_network.create_virtual_network.location
}
