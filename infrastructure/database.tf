# Azure SQL Database
# ==================
#
# Define a database as a service to deploy the database project to
# Database DDL will be deployed from Azure Data Studio SQL Server Project

# A SQL Server to implement the data twin for enaio
resource "azurerm_mssql_server" "maskeddemodbserver" {
  name                = "maskeddemosqlserver"
  resource_group_name = azurerm_resource_group.rg-maskeddemo.name
  location            = var.azure_location 
  version             = "12.0"
  minimum_tls_version = "1.2"
  # should be only for dev
  public_network_access_enabled = true

  azuread_administrator {
    login_username              = "Azure SQL Admin"
    object_id                   = data.azurerm_client_config.current.object_id
    tenant_id                   = data.azurerm_client_config.current.tenant_id
    azuread_authentication_only = true 
  }

  identity {
    type = "SystemAssigned"
  }
}

# create a SQL Database as a service
resource "azurerm_mssql_database" "maskeddemodb" {
  name      = "MaskedColumnDemo"
  server_id = azurerm_mssql_server.maskeddemodbserver.id
  collation = "SQL_Latin1_General_CP1_CI_AS"
  #license_type   = "LicenseIncluded"
  sku_name       = "Basic"
  zone_redundant = false
}

## allow dev to connect to the database
resource "azurerm_mssql_firewall_rule" "my-local-machine" {
  name             = "${var.PROJECTNAME}-machine"
  server_id        = azurerm_mssql_server.maskeddemodbserver.id
  start_ip_address = local.my_ip
  end_ip_address   = local.my_ip
}
