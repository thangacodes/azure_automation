### Creating Resource Group
resource "azurerm_resource_group" "apprsgrp" {
  name     = local.common.resource_group_name
  location = local.common.location
}

### Creating VNET in Azure Cloud
resource "azurerm_virtual_network" "webvnet" {
  name                = local.vnet_var.vnetname
  address_space       = [local.vnet_var.vnetrange]
  resource_group_name = local.common.resource_group_name
  location            = local.common.location
  depends_on          = [azurerm_resource_group.apprsgrp]
  tags                = merge(local.tagging, { Name = "Web-VNET" })
}

### Creating Private Subnet1
resource "azurerm_subnet" "Websubnet" {
  name                 = local.vnet_var.pvtsubnet1name
  virtual_network_name = azurerm_virtual_network.webvnet.name
  address_prefixes     = [local.vnet_var.pvtsubnet1]
  resource_group_name  = local.common.resource_group_name
  depends_on           = [azurerm_virtual_network.webvnet]
}

### Creating Network interface
resource "azurerm_network_interface" "appvminterface" {
  name                = local.common.interface_name
  resource_group_name = local.common.resource_group_name
  location            = local.common.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.Websubnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.appip.id
  }
  depends_on = [azurerm_subnet.Websubnet]
}

### Creating Public IP address
resource "azurerm_public_ip" "appip" {
  name                = local.common.public_ip_name
  resource_group_name = local.common.resource_group_name
  location            = local.common.location
  allocation_method   = "Static"
  depends_on          = [azurerm_resource_group.apprsgrp]
}

### Note: I referred in Terraform documentation on azurerm, where there are some attributes need not to be called in local or variables files.
### Hence, they suggested to use as it is,
## Example is that private_ip_address_allocation = "Dynamic"  && allocation_method   = "Static" | These are should be as Static or Dynamic 


