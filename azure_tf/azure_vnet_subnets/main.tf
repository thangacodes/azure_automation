resource "azurerm_resource_group" "bsgroup" {
  name     = local.rgp.groupname
  location = local.rgp.location
}

resource "azurerm_virtual_network" "blackstone" {
  name                = local.ipranges.vnetname
  resource_group_name = azurerm_resource_group.bsgroup.name
  location            = azurerm_resource_group.bsgroup.location
  address_space       = [local.ipranges.vnetip]
  tags                = merge(local.default, { Name = local.ipranges.vnetname })
}

resource "azurerm_subnet" "vlana" {
  name                 = local.subnet_names.privatesubnet1
  resource_group_name  = azurerm_resource_group.bsgroup.name
  virtual_network_name = azurerm_virtual_network.blackstone.name
  address_prefixes     = [local.ipranges.private_subneta]
  depends_on           = [azurerm_virtual_network.blackstone]
}
resource "azurerm_subnet" "vlanb" {
  name                 = local.subnet_names.privatesubnet2
  resource_group_name  = azurerm_resource_group.bsgroup.name
  virtual_network_name = azurerm_virtual_network.blackstone.name
  address_prefixes     = [local.ipranges.private_subnetb]
  depends_on           = [azurerm_virtual_network.blackstone]
}
resource "azurerm_subnet" "vlanc" {
  name                 = local.subnet_names.publicsubnet1
  resource_group_name  = azurerm_resource_group.bsgroup.name
  virtual_network_name = azurerm_virtual_network.blackstone.name
  address_prefixes     = [local.ipranges.public_subneta]
  depends_on           = [azurerm_virtual_network.blackstone]
}
resource "azurerm_subnet" "vland" {
  name                 = local.subnet_names.publicsubnet2
  resource_group_name  = azurerm_resource_group.bsgroup.name
  virtual_network_name = azurerm_virtual_network.blackstone.name
  address_prefixes     = [local.ipranges.public_subnetb]
  depends_on           = [azurerm_virtual_network.blackstone]
}
