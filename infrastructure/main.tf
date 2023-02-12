terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">3.40"
    }
    curl = {
      source  = "anschoewe/curl"
      version = ">=0.1.4"
    }
  }
  # define backend for collaboration
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }

  subscription_id = var.SUBSCRIPTION
}

# get the curreent ip adress to modify network rules
provider "curl" {

}
data "curl" "getIp" {
  http_method = "GET"
  uri         = "https://api.ipify.org"
}

data "azurerm_client_config" "current" {}

locals {
  my_ip = data.curl.getIp.response
}

output "current_ip" {
  value = local.my_ip
}

# Get the resource group for the project under terraform control
resource "azurerm_resource_group" "rg-maskeddemo" {
  name     = "rg-maskeddemo"
  location = var.azure_location
}
