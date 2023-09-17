### Creating a Windows VM in Azure Cloud
resource "azurerm_virtual_machine" "iisbox" {
  name                             = "IIS-Server"
  resource_group_name              = local.common.resource_group_name
  location                         = local.common.location
  network_interface_ids            = [azurerm_network_interface.appvminterface.id]
  vm_size                          = "Standard_DS1_v2"
  delete_data_disks_on_termination = true
  delete_os_disk_on_termination    = true
  storage_os_disk {
    name          = "webappOSisk"
    create_option = "FromImage"
    caching       = "ReadWrite"
  }
  storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
  os_profile {
    computer_name  = "INBLRCAP123"
    admin_username = "admin"
    admin_password = "login123456"
  }
  depends_on = [azurerm_network_interface.appvminterface,
    azurerm_resource_group.apprsgrp
  ]
}
