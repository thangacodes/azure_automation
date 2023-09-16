resource "azurerm_resource_group" "appgroup" {
  name     = local.grpname
  location = local.locationname
}

resource "azurerm_storage_account" "appstorage143" {
  name                     = local.storagename
  resource_group_name      = azurerm_resource_group.appgroup.name
  location                 = azurerm_resource_group.appgroup.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  depends_on               = [azurerm_resource_group.appgroup]
  tags                     = merge(local.default, { Name = local.storagename })
}

resource "azurerm_storage_container" "data" {
  name                  = local.containername
  storage_account_name  = local.storagename
  container_access_type = "blob"
  depends_on            = [azurerm_storage_account.appstorage143]
}

resource "azurerm_storage_blob" "object" {
  name                   = local.blobname
  storage_account_name   = azurerm_storage_account.appstorage143.name
  storage_container_name = azurerm_storage_container.data.name
  type                   = "Block"
  depends_on             = [azurerm_storage_container.data]
}
