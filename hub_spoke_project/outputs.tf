## This is the section, where you'd like to get or see print of defined resources in terraform

output "hubvnet_iprange" {
  value = azurerm_virtual_network.hub.address_space
}
output "hubvnet_name" {
  value = azurerm_virtual_network.hub.name
}
output "natgw_pubip" {
  value = azurerm_public_ip.pubip.ip_address
}
output "gatewaysubnetiprange" {
  value = azurerm_subnet.private1.address_prefixes
}

