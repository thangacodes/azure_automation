## Azure Resource group creation
resource "azurerm_resource_group" "lab_group" {
  name     = "lab_resources"
  location = "eastus"
}

# Hub-Vnet creation with one private subnet creation
resource "azurerm_network_security_group" "labsg" {
  name                = "lab-security-group"
  location            = azurerm_resource_group.lab_group.location
  resource_group_name = azurerm_resource_group.lab_group.name
}

### Hub Vnet Creation
resource "azurerm_virtual_network" "hub" {
  name                = "hub_vnet"
  location            = azurerm_resource_group.lab_group.location
  resource_group_name = azurerm_resource_group.lab_group.name
  address_space       = var.hubvnetiprange
  dns_servers         = var.dnsiprange
  tags                = merge(local.default, { Name = "Hub-Vnet" })
}

## Hub_subnet Creation
resource "azurerm_subnet" "private1" {
  name                 = "gateway-subnet"
  resource_group_name  = azurerm_resource_group.lab_group.location
  virtual_network_name = azurerm_virtual_network.hub.name
  address_prefixes     = var.address_prefixes
}

## Creating NAT gateway for private subnets in Hub-Vnet

## Allocating or provisioning a Public_IP from Azure IP pool
resource "azurerm_public_ip" "pubip" {
  name                = "nat-gateway-publicIP"
  location            = azurerm_resource_group.lab_group.location
  resource_group_name = azurerm_resource_group.lab_group.name
  allocation_method   = "Static"
  sku                 = "Standard"
  zones               = ["1"]
}

resource "azurerm_public_ip_prefix" "iprefix" {
  name                = "nat-gateway-publicIPPrefix"
  location            = azurerm_resource_group.lab_group.location
  resource_group_name = azurerm_resource_group.lab_group.name
  prefix_length       = 30
  zones               = ["1"]
}

resource "azurerm_nat_gateway" "hubngw" {
  name                    = "nat-Gateway"
  location                = azurerm_resource_group.lab_group.location
  resource_group_name     = azurerm_resource_group.lab_group.name
  sku_name                = "Standard"
  idle_timeout_in_minutes = 10
  zones                   = ["1"]
  tags                    = merge(local.default, { Name = "Hub-Nat-Gateway-for-private-subnets" })
}

# Private subnet association to nat gateway
resource "azurerm_subnet_nat_gateway_association" "private_subnet_association" {
  subnet_id      = azurerm_subnet.private1.id
  nat_gateway_id = azurerm_nat_gateway.hubngw.id
}
