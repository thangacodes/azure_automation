provider "azurerm" {
  features {}

  subscription_id = "<azure_subscription_id>"
  tenant_id       = "<azure_subscription_tenant_id>"
  client_id       = "<service_principal_appid>"
  client_secret   = "<service_principal_password>"
}
