# Azure SQL Database
# ==================
#
# Define a database as a service to deploy the database project to
# Database DDL will be deployed from Azure Data Studio SQL Server Project

# A SQL Server to implement the data twin for enaio
resource "azurerm_mssql_server" "maskeddemodbserver" {
  name                = "maskeddemosqlserver"
  resource_group_name = azurerm_resource_group.rg-enaiodatatwin.name
  location            = azurerm_resource_group.rg-enaiodatatwin.location
  version             = "12.0"
  minimum_tls_version = "1.2"
  # should be only for dev
  public_network_access_enabled = true

  azuread_administrator {
    login_username              = "tha_db_admin"
    object_id                   = "976bf5c3-XXXX-XXXX-XXXX-0d6e5aca523c"
    tenant_id                   = var.tenantId
    azuread_authentication_only = true
  }
}

# create a SQL Database as a service
resource "azurerm_mssql_database" "maskeddemodb" {
  name      = "maskeddemodb"
  server_id = azurerm_mssql_server.maskeddemodbserver.id
  collation = "SQL_Latin1_General_CP1_CI_AS"
  #license_type   = "LicenseIncluded"
  sku_name       = "S0"
  zone_redundant = false
}

## allow dev to connect to the database
resource "azurerm_mssql_firewall_rule" "my-local-machine" {
  name             = "${var.USERNAME}-machine"
  server_id        = azurerm_mssql_server.maskeddemodbserver.id
  start_ip_address = local.my_ip
  end_ip_address   = local.my_ip
}