## Create a NonProdVNET along with 3 subnets like PublicSub2,AppSub2 and StorageSub2  
resource "azurerm_virtual_network" "nonprod" {
  name                = "NONPROD-VNET"
  location            = azurerm_resource_group.lab_group.location
  resource_group_name = azurerm_resource_group.lab_group.name
  address_space       = var.nonprod
  tags                = merge(local.default, { Name = "NONPRODVNET" })
}

##Create a public subnet in NONPROD VNET
resource "azurerm_subnet" "nonprodsubnet" {
  virtual_network_name = azurerm_virtual_network.nonprod.id
  resource_group_name  = azurerm_resource_group.lab_group.name
  address_prefixes     = var.nonprod-pubsubnet
  name                 = "NonProd-publicsubnet"
}

## Create a private subnet in NONPROD VNET
resource "azurerm_subnet" "nonprod-privatesubnet" {
  for_each             = var.address_prefixes
  virtual_network_name = azurerm_virtual_network.nonprod.id
  resource_group_name  = azurerm_resource_group.lab_group.name
  address_prefixes     = each.value["address_prefixes"]
  name                 = each.value["name"]
}
