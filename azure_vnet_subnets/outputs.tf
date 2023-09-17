output "vnetrange" {
  value = azurerm_virtual_network.blackstone.address_space
}
output "privatrangea" {
  value = azurerm_subnet.vlana.address_prefixes
}
output "privatrangeb" {
  value = azurerm_subnet.vlanb.address_prefixes
}
output "publicrangea" {
  value = azurerm_subnet.vlanc.address_prefixes
}
output "publicrangeb" {
  value = azurerm_subnet.vland.address_prefixes
}
