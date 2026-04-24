variable "prefix" {
  description = "Prefix for all resources in the landing zone."
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
variable "tags" {
  description = "Tags to apply to the storage account."
  type        = map(string)
}
