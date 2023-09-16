terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.73.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "please enter subscription id"
  tenant_id       = "please enter tenant id"
  client_id       = "please enter client id"
  client_secret   = "please enter client_secret"
  features {}
}
