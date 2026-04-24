variable "prefix" {
  description = "Prefix for all resources in the landing zone."
  type        = string
}

variable "suffix" {
  description = "Suffix for the storage account name."
  type        = string
}
variable "location" {
  description = "Azure region for the resources."
  type        = string
}
variable "rg_name" {
  description = "Name of the resource group."
  type        = string
}
variable "containers" {
  description = "List of containers to create in the storage account."
  type        = list(string)
  default     = []
}
variable "tags" {
  description = "Tags to apply to the storage account."
  type        = map(string)
}
