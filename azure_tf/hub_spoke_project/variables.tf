## HUB VNET IP range define
variable "hubvnetiprange" {
  default     = ["11.0.0.0/16"]
  type        = list(string)
  description = "IP CIDR for Hub-Vnet"
}
## HUB VNET DNS IP ranges
variable "dnsiprange" {
  default     = ["11.0.0.4", "11.0.0.5"]
  type        = list(string)
  description = "Allocating two IP's DNS server"
}
# HUB VNET Gateway Subnet IP Range define
variable "address_prefixes" {
  type        = list(string)
  default     = ["11.0.1.0/24"]
  description = "gateway_subnet_iprange"
}
#########################################################################################################
## PRODVNET IP RANGE
variable "prodvnet" {
  default     = ["12.0.0.0/16"]
  type        = list(string)
  description = "IP CIDR range for PROD VNET"
}

#UNDER PRODVENT PUBLIC SUBNET IP RANGE
variable "prod-pubsubnet" {
  default     = ["12.0.2.0/24"]
  type        = list(string)
  description = "IP Range for prod public subnet"
}

## UNDER PRODVNET PRIVATE SUBNETS LIKE APP/STORAGE IP RANGE
variable "subnet_prefix" {
  type = map(any)
  default = {
    appsubnet1 = {
      address_prefixes = ["12.0.3.0/24"]
      name             = "appsubnet1"
    }
    storagesubnet1 = {
      address_prefixes = ["12.0.4.0/24"]
      name             = "storagesubnet1"
    }
  }
}

## NONPRODVNET IP RANGE
variable "nonprod" {
  default     = ["13.0.0.0/16"]
  type        = list(string)
  description = "IP CIDR range for NONPROD VNET"
}

#UNDER PRODVENT PUBLIC SUBNET IP RANGE
variable "nonprod-pubsubnet" {
  default     = ["13.0.2.0/24"]
  type        = list(string)
  description = "IP Range for prod public subnet"
}
## UNDER PRODVNET PRIVATE SUBNETS LIKE APP/STORAGE IP RANGE
variable "subnet_range" {
  type = map(any)
  default = {
    appsubnet1 = {
      address_prefixes = ["13.0.3.0/24"]
      name             = "appsubnet2"
    }
    storagesubnet1 = {
      address_prefixes = ["13.0.4.0/24"]
      name             = "storagesubnet2"
    }
  }
}
