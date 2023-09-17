resource "azurerm_resource_group" "bsgroup" {
  name     = "BlockstoneRGP"
  location = "useast"
}

resource "azurerm_virtual_network" "blackstone" {
  name                = "Blackstone-Network"
  resource_group_name = azurerm_resource_group.bsgroup.name
  location            = azurerm_resource_group.bsgroup.location
  address_space       = [local.vnetip]
  tags                = merge(local.default, { Name = "Blackstone-Network" })
}

resource "azurerm_subnet" "vlana" {
  name                 = "Private-subnetA"
  resource_group_name  = azurerm_resource_group.bsgroup.name
  virtual_network_name = azurerm_virtual_network.blackstone.name
  address_prefixes     = [local.private_subneta]
  depends_on           = [azurerm_virtual_network.blackstone]
}
resource "azurerm_subnet" "vlanb" {
  name                 = "Private-subnetB"
  resource_group_name  = azurerm_resource_group.bsgroup.name
  virtual_network_name = azurerm_virtual_network.blackstone.name
  address_prefixes     = [local.private_subnetb]
  depends_on           = [azurerm_virtual_network.blackstone]
}
resource "azurerm_subnet" "vlanc" {
  name                 = "Public-subnetA"
  resource_group_name  = azurerm_resource_group.bsgroup.name
  virtual_network_name = azurerm_virtual_network.blackstone.name
  address_prefixes     = [local.public_subneta]
  depends_on           = [azurerm_virtual_network.blackstone]
}
resource "azurerm_subnet" "vland" {
  name                 = "Public-subnetB"
  resource_group_name  = azurerm_resource_group.bsgroup.name
  virtual_network_name = azurerm_virtual_network.blackstone.name
  address_prefixes     = [local.public_subnetb]
  depends_on           = [azurerm_virtual_network.blackstone]
}
