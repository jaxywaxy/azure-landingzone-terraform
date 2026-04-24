variable "prefix" {
  description = "Prefix for all resources in the landing zone."
  type        = string
}

variable "location" {
  description = "Azure region for the resources."
  type        = string
}

variable "rg_network" {
  description = "Name of the networking resource group."
  type        = string
}
variable "tags" {
  description = "Tags to apply to the networking resources."
  type        = map(string)
  default     = {}
}
