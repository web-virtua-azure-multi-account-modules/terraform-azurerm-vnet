locals {
  tags_virtual_network = {
    "tf-name" = var.name
    "tf-type" = "vnet"
  }
}

data "azurerm_resource_group" "get_resource_group" {
  name = var.resource_group_name
}

resource "azurerm_virtual_network" "create_virtual_network" {
  name                    = var.name
  resource_group_name     = data.azurerm_resource_group.get_resource_group.name
  location                = data.azurerm_resource_group.get_resource_group.location
  address_space           = var.ip_adresses
  dns_servers             = var.dns_servers
  bgp_community           = var.bgp_community
  edge_zone               = var.edge_zone
  flow_timeout_in_minutes = var.flow_timeout_in_minutes
  tags                    = merge(var.tags, var.use_tags_default ? local.tags_virtual_network : {})

  dynamic "ddos_protection_plan" {
    for_each = var.ddos_protection_plan_id != null ? [1] : []

    content {
      id     = var.ddos_protection_plan_id
      enable = true
    }
  }

  dynamic "encryption" {
    for_each = var.encryption_enforcement != null ? [1] : []

    content {
      enforcement = var.encryption_enforcement
    }
  }
}
