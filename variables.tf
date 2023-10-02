variable "name" {
  description = "Resource group name"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "ip_adresses" {
  description = "The list of address spaces or ip adresses used by the virtual network, it looks like the CIDR BLOCK, but to many IPs"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "dns_servers" {
  description = "List of IP addresses of DNS servers"
  type        = list(string)
  default     = null
}

variable "bgp_community" {
  description = "The BGP community attribute in format <as-number>:<community-value>"
  type        = string
  default     = null
}

variable "edge_zone" {
  description = "Specifies the Edge Zone within the Azure Region where this Virtual Network should exist. Changing this forces a new Virtual Network to be created"
  type        = string
  default     = null
}

variable "ddos_protection_plan_id" {
  description = "If defined will be attached this DDOs protection plan in virtual network ID"
  type        = string
  default     = null
}

variable "flow_timeout_in_minutes" {
  description = "The flow timeout in minutes for the Virtual Network, which is used to enable connection tracking for intra-VM flows. Possible values are between 4 and 30 minutes"
  type        = number
  default     = null
}

variable "encryption_enforcement" {
  description = "Specifies if the encrypted Virtual Network allows VM that does not support encryption. Possible values are DropUnencrypted and AllowUnencrypted"
  type        = string
  default     = null
}

variable "use_tags_default" {
  description = "If true will be use the tags default to resources"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags to virtual network"
  type        = map(any)
  default     = {}
}
