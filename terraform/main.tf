terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.26.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "BeStrong-resource-group"
    storage_account_name = "tfstatebestrong324"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

resource "azurerm_storage_account" "terraform_state" {
  name                     = "tfstatebestrong324"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = var.account_tier_terraform_state
  account_replication_type = var.account_replication_type_terraform_state
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_id    = azurerm_storage_account.terraform_state.id
  container_access_type = "private"
}

#App service
resource "azurerm_service_plan" "asp" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = var.os_type
  sku_name            = var.sku_name_asp
}

resource "azurerm_linux_web_app" "webapp" {
  name                = "bestong-webapp"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id     = azurerm_service_plan.asp.id

  site_config {
    container_registry_use_managed_identity = false
    app_command_line                        = ""

    application_stack {
      docker_registry_url      = "https://index.docker.io"
      docker_image_name        = "vladyslavkuliavets/bestong-api:latest"
      docker_registry_username = var.docker_username
      docker_registry_password = var.docker_password
    }
  }

  app_settings = {
  "WEBSITES_PORT"      = "80"
  "ASPNETCORE_URLS"    = "http://+:80"
  }

  identity {
    type = "SystemAssigned"
  }
}
