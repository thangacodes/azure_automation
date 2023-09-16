locals {
  grpname       = "appgroup"
  locationname  = "useast"
  storagename   = "appstorage143"
  containername = "data"
  blobname      = "object.txt"
}

locals {
  default = {
    Environment  = "Development"
    CreationDate = "16/09/2023"
    Owner        = "Thangadurai.Murugan@example.com"
    Costcentre   = "10100344"
  }
}
