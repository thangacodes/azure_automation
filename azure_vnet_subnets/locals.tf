### local variables for Resource group section 
locals {
  rgp = {
    groupname = "BlockstoneRGP"
    location  = "useast"
  }
}

### local variables for Tagging section for any resources 
locals {
  default = {
    Environment     = "Development"
    Owner           = "Thangadurai.murugan@example.com"
    Creationdate    = "17/09/2023"
    Costcentre      = "100033245"
    Project         = "Blackstone-Application-Development"
    Azurerm_version = "3.73.0"
    TF_version      = "v1.2.8"

  }
}

### local variables for Subnet names
locals {
  subnet_names = {
    privatesubnet1 = "Private-subnetA"
    privatesubnet2 = "Private-subnetB"
    publicsubnet1  = "Public-subnetA"
    publicsubnet2  = "Public-subnetB"
  }
}

### local variables for vnet,subnet ip ranges
locals {
  ipranges = {
    vnetip          = "192.168.0.0/16"
    vnetname        = "Blackstone-Network"
    private_subneta = "192.168.1.0/24"
    private_subnetb = "192.168.2.0/24"
    public_subneta  = "192.168.3.0/24"
    public_subnetb  = "192.168.4.0/24"
  }
}
