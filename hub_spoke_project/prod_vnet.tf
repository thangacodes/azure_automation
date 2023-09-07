## Create a ProdVNET along with 3 subnets like PublicSub1,AppSub1 and StorageSub1 
resource "azurerm_virtual_network" "prod" {
  name                = "PROD-VNET"
  location            = azurerm_resource_group.lab_group.location
  resource_group_name = azurerm_resource_group.lab_group.name
  address_space       = var.prodvnet
  tags                = merge(local.default, { Name = "ProdVNET" })
}

## Create a public subnet in PROD VNET
resource "azurerm_subnet" "prodsubnet" {
  virtual_network_name = azurerm_virtual_network.prod.id
  resource_group_name  = azurerm_resource_group.lab_group.name
  address_prefixes     = var.prod-pubsubnet
  name                 = "Prod-publicsubnet"
}

## Create a private subnet in PROD VNET
resource "azurerm_subnet" "prod-privatesubnet" {
  for_each             = var.address_prefixes
  virtual_network_name = azurerm_virtual_network.prod.id
  resource_group_name  = azurerm_resource_group.lab_group.name
  address_prefixes     = each.value["address_prefixes"]
  name                 = each.value["name"]
}
