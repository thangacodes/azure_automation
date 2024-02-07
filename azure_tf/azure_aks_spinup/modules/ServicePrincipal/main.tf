data "azuread_client_config" "mylab" {}

resource "azuread_application" "spn" {
  display_name = var.spn_name
  owners       = [data.azuread_client_config.mylab.object_id]
}

resource "azuread_service_principal" "mylab-spn" {
  client_id                    = azuread_application.spn.client_id
  app_role_assignment_required = true
  owners                       = [data.azuread_client_config.mylab.object_id]
}

resource "azuread_service_principal_password" "mylab" {
  service_principal_id = azuread_service_principal.mylab-spn.object_id
}
