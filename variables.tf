## HUB VNET IP range define
variable "hubvnetiprange" {
  default     = ["192.168.0.0/16"]
  type        = list(string)
  description = "IP CIDR for Hub-Vnet"
}
## HUB VNET DNS IP ranges
variable "dnsiprange" {
  default     = ["192.168.0.4", "192.168.0.5"]
  type        = list(string)
  description = "Allocating two IP's DNS server"
}
# HUB VNET Gateway Subnet IP Range define
variable "address_prefixes" {
  type        = list(string)
  default     = ["192.168.1.0/24"]
  description = "gateway_subnet_iprange"
}
#########################################################################################################
## PRODVNET IP RANGE
variable "prodvnet" {
  default     = ["192.170.0.0/16"]
  type        = list(string)
  description = "IP CIDR range for PROD VNET"
}

#UNDER PRODVENT PUBLIC SUBNET IP RANGE
variable "prod-pubsubnet" {
  default     = ["192.170.1.0/24"]
  type        = list(string)
  description = "IP Range for prod public subnet"
}

## UNDER PRODVNET PRIVATE SUBNETS LIKE APP/STORAGE IP RANGE
variable "subnet_prefix" {
  type = map(any)
  default = {
    appsubnet1 = {
      address_prefixes = ["192.170.2.0/24"]
      name             = "appsubnet1"
    }
    storagesubnet1 = {
      address_prefixes = ["192.170.3.0/24"]
      name             = "storagesubnet1"
    }
  }
}

## NONPRODVNET IP RANGE
variable "nonprod" {
  default     = ["192.180.0.0/16"]
  type        = list(string)
  description = "IP CIDR range for NONPROD VNET"
}

#UNDER PRODVENT PUBLIC SUBNET IP RANGE
variable "nonprod-pubsubnet" {
  default     = ["192.180.1.0/24"]
  type        = list(string)
  description = "IP Range for prod public subnet"
}
## UNDER PRODVNET PRIVATE SUBNETS LIKE APP/STORAGE IP RANGE
variable "subnet_range" {
  type = map(any)
  default = {
    appsubnet1 = {
      address_prefixes = ["192.180.2.0/24"]
      name             = "appsubnet2"
    }
    storagesubnet1 = {
      address_prefixes = ["192.180.3.0/24"]
      name             = "storagesubnet2"
    }
  }
}
