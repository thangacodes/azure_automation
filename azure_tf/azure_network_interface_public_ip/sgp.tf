### Creating security group
resource "azurerm_network_security_group" "apptraffic" {
  name                = "Web_traffic_SGP"
  location            = local.common.location
  resource_group_name = local.common.resource_group_name
  security_rule {
    name                   = "allowing RDP"
    priority               = 100
    direction              = "Inbound"
    access                 = "Allow"
    protocol               = "Tcp"
    source_port_range      = "*"
    destination_port_range = "3389"
  }
  tags = merge(local.tagging, { Name = "Web_traffic_SGP" })
}

### Associating Security Group after creation
resource "azurerm_subnet_network_security_group_association" "websgp-association" {
  subnet_id                 = azurerm_subnet.Websubnet.id
  network_security_group_id = azurerm_network_security_group.apptraffic.id
}
