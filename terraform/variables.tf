variable "resource_group_name" {
  description = "Existing Resource Group Name"
  type        = string
}

variable "resource_group_location" {
  description = "Existing Resource Group Location"
  type        = string
}

variable "subscription_id" {
  description = "Existing Subscription Id"
  type        = string
  sensitive   = true
}

variable "app_service_plan_name" {
  description = "Existing app service plan Name"
  type        = string
}

variable "os_type" {
  description = "Existing App Service Plan OS"
  type        = string
}

variable "sku_name_asp" {
  description = "Existing App Service Plan Sku name"
  type        = string
}

variable "docker_username" {
  description = "Docker Hub username"
  sensitive   = true
}
variable "docker_password" {
  description = "Docker Hub password or personal access token"
  sensitive   = true
}