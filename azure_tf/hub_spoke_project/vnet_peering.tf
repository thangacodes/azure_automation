## VNET peering for hub-spoke. Here the connection flows between hub-spoke as HUB VNET and NON-PROD VNET
resource "azurerm_virtual_network_peering" "hub-spoke-nonprod-peer" {
  name                         = "hub-spoke-nonprod-peer"
  resource_group_name          = azurerm_resource_group.hubgroup.name
  virtual_network_name         = azurerm_virtual_network.hub.name
  remote_virtual_network_id    = azurerm_virtual_network.nonprod.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = true
  use_remote_gateways          = false
  depends_on                   = [azurerm_virtual_network.hub, azurerm_virtual_network.nonprod]
}

resource "azurerm_virtual_network_peering" "nonprod-hub-spoke-peer" {
  name                         = "nonprod-hub-spoke-peer"
  resource_group_name          = azurerm_resource_group.nonprod.name
  virtual_network_name         = azurerm_virtual_network.nonprod.name
  remote_virtual_network_id    = azurerm_virtual_network.hub.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = true
  use_remote_gateways          = false
  depends_on                   = [azurerm_virtual_network.nonprod, azurerm_virtual_network.hub]
}

## VNET peering for hub-spoke. Here the connection flows between hub-spoke as HUB VNET and PROD VNET

resource "azurerm_virtual_network_peering" "hub-spoke-prod-peer" {
  name                         = "hub-spoke-prod-peer"
  resource_group_name          = azurerm_resource_group.hubgroup.name
  virtual_network_name         = azurerm_virtual_network.hub.name
  remote_virtual_network_id    = azurerm_virtual_network.prod.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = true
  use_remote_gateways          = false
  depends_on                   = [azurerm_virtual_network.hub, azurerm_virtual_network.prod]
}

resource "azurerm_virtual_network_peering" "prod-hub-spoke-peer" {
  name                         = "prod-hub-spoke-peer"
  resource_group_name          = azurerm_resource_group.prod.name
  virtual_network_name         = azurerm_virtual_network.prod.name
  remote_virtual_network_id    = azurerm_virtual_network.hub.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = true
  use_remote_gateways          = false
  depends_on                   = [azurerm_virtual_network.prod, azurerm_virtual_network.hub]
}
