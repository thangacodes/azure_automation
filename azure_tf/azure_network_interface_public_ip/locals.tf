### local variables for VNET and subnet and it's names
locals {
  vnet_var = {
    vnetrange      = "192.168.0.0/16"
    vnetname       = "Webapp-VNET"
    pvtsubnet1     = "192.168.1.0/24"
    pvtsubnet1name = "Private-Subnet1"
  }
}

### local variables for vm network interface
locals {
  common = {
    resource_group_name = "app-resourcegroup"
    location            = "useast"
    interface_name      = "app-interface"
    public_ip_name      = "Web-pubip"
  }
}

### Creating common tags for the resources in local variables
locals {
  tagging = {
    Costcentre        = "10003434"
    Environment       = "sandbox"
    TF_version        = "v1.2.8"
    Azurerm_version   = "3.73.0"
    owner             = "thangadurai.murugan@example.com"
    ResourceGroupName = "app-resourcegroup"
  }
}
