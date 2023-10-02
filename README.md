# Azure Virtual Network for multiples accounts with Terraform module
* This module simplifies creating and configuring of Virtual Network across multiple accounts on Azure

* Is possible use this module with one account using the standard profile or multi account using multiple profiles setting in the modules.

## Actions necessary to use this module:

* Criate file provider.tf with the exemple code below:
```hcl
provider "azurerm" {
  alias   = "alias_profile_a"

  features {}
}

provider "azurerm" {
  alias   = "alias_profile_b"

  features {}
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
}
```


## Features enable of Virtual Network configurations for this module:

- Virtual Network

## Usage exemples


### Create Virtual Network

```hcl
module "virtual_network_test" {
  source = "web-virtua-azure-multi-account-modules/vnet/azurerm"

  name                = "tf-test-vnet"
  resource_group_name = var.resource_group_name
  ip_adresses         = ["10.0.0.0/16"]

  providers = {
    azurerm = azurerm.alias_profile_b
  }
}
```

## Variables

| Name | Type | Default | Required | Description | Options |
|------|-------------|------|---------|:--------:|:--------|
| name | `string` | `-` | yes | Resource group name | `-` |
| resource_group_name | `string` | `-` | yes | Resource group name | `-` |
| ip_adresses | `list(string)` | `["10.0.0.0/16"]` | no | The list of address spaces or ip adresses used by the virtual network, it looks like the CIDR BLOCK, but to many IPs, default is 10.0.0.0/16 | `-` |
| dns_servers | `list(string)` | `-` | no | List of IP addresses of DNS servers | `-` |
| bgp_community | `string` | `-` | no | The BGP community attribute in format <as-number>:<community-value> | `-` |
| edge_zone | `string` | `null` | no | Specifies the Edge Zone within the Azure Region where this Virtual Network should exist. Changing this forces a new Virtual Network to be created | `-` |
| ddos_protection_plan_id | `string` | `null` | no | If defined will be attached this DDOs protection plan in virtual network ID | `-` |
| flow_timeout_in_minutes | `number` | `null` | no | The flow timeout in minutes for the Virtual Network, which is used to enable connection tracking for intra-VM flows. Possible values are between 4 and 30 minutes | `-` |
| encryption_enforcement | `string` | `null` | no | Specifies if the encrypted Virtual Network allows VM that does not support encryption. Possible values are DropUnencrypted and AllowUnencrypted | `*`AllowUnencrypted <br> `*`DropUnencrypted |
| use_tags_default | `bool` | `true` | no | If true will be use the tags default to resources | `*`false <br> `*`true |
| tags | `map(any)` | `{}` | no | Tags to virtual network | `-` |


## Resources

| Name | Type |
|------|------|
| [azurerm_virtual_network.create_virtual_network](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |

## Outputs

| Name | Description |
|------|-------------|
| `vnet` | Virtual network |
| `vnet_id` | Virtual network ID |
| `vnet_name` | Virtual network name |
| `vnet_location` | Virtual network location |
