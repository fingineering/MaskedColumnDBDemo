variable "USERNAME" {
  type        = string
  description = "Name of the User, cloud be principal name"
}

variable "PROJECTNAME" {
  type        = string
  description = "Give your project a name"
  default     = "MaskedColumns"
}

variable "azure_location" {
  type = string
  description = "Region to create the infrastructure"
  default = "westeurope"
}

variable "SUBSCRIPTION" {
  type = string
  sensitive = true
}
