resource "azurerm_resource_group" "mylab" {
  name     = var.rgp_name
  location = var.rgp_location
}

module "ServicePrincipal" {
  source   = "./modules/ServicePrincipal"
  spn_name = var.spn_name

  depends_on = [azurerm_resource_group.mylab]
}

resource "azurerm_role_assignment" "rolespn" {
  scope                = "/subscriptions/14dcfee2-b365-4413-bac2-b4e8cb470795/resourceGroups/mylab_rgp"
  role_definition_name = "Contributor"
  principal_id         = module.ServicePrincipal.service_principal_object_id
  depends_on           = [module.ServicePrincipal]
}
