## Azure Resource group creation
resource "azurerm_resource_group" "hubgroup" {
  name     = "hub_resources"
  location = "eastus"
}

# Hub-Vnet creation with one private subnet creation
resource "azurerm_network_security_group" "labsg" {
  name                = "hub-security-group"
  location            = azurerm_resource_group.hubgroup.location
  resource_group_name = azurerm_resource_group.hubgroup.name
}

### Hub Vnet Creation
resource "azurerm_virtual_network" "hub" {
  name                = "hub_vnet"
  location            = azurerm_resource_group.hubgroup.location
  resource_group_name = azurerm_resource_group.hubgroup.name
  address_space       = var.hubvnetiprange
  dns_servers         = var.dnsiprange
  tags                = merge(local.default, { Name = "HUB-VNET" })
}

## Hub_subnet Creation
resource "azurerm_subnet" "private1" {
  name                 = "gateway-subnet"
  resource_group_name  = azurerm_resource_group.hubgroup.location
  virtual_network_name = azurerm_virtual_network.hub.name
  address_prefixes     = var.address_prefixes
}

## Creating NAT gateway for private subnets in Hub-Vnet

## Allocating or provisioning a Public_IP from Azure IP pool
resource "azurerm_public_ip" "pubip" {
  name                = "nat-gateway-publicIP"
  location            = azurerm_resource_group.hubgroup.location
  resource_group_name = azurerm_resource_group.hubgroup.name
  allocation_method   = "Static"
  sku                 = "Standard"
  zones               = ["1"]
}

resource "azurerm_public_ip_prefix" "iprefix" {
  name                = "nat-gateway-publicIPPrefix"
  location            = azurerm_resource_group.hubgroup.location
  resource_group_name = azurerm_resource_group.hubgroup.name
  prefix_length       = 30
  zones               = ["1"]
}

resource "azurerm_nat_gateway" "hubngw" {
  name                    = "nat-Gateway"
  location                = azurerm_resource_group.hubgroup.location
  resource_group_name     = azurerm_resource_group.hubgroup.name
  sku_name                = "Standard"
  idle_timeout_in_minutes = 10
  zones                   = ["1"]
  tags                    = merge(local.default, { Name = "Hub-Nat-Gateway-for-private-subnets" })
}

## Public IP association to the NAT gateway post reserving public ip in the azure pool
resource "azurerm_nat_gateway_public_ip_prefix_association" "natpubipassoc" {
  nat_gateway_id      = azurerm_nat_gateway.hubngw.id
  public_ip_prefix_id = azurerm_public_ip_prefix.iprefix.id
}

# Private subnet association to nat gateway
resource "azurerm_subnet_nat_gateway_association" "private_subnet_association" {
  subnet_id      = azurerm_subnet.private1.id
  nat_gateway_id = azurerm_nat_gateway.hubngw.id
}
