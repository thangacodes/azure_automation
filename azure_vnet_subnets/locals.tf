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

locals {
  vnetip          = "192.168.0.0/16"
  private_subneta = "192.168.1.0/24"
  private_subnetb = "192.168.2.0/24"
  public_subneta  = "192.168.3.0/24"
  public_subnetb  = "192.168..0/24"
}
