variable "prefix" {
  type = string
}

variable "location" {
  type = string
}

variable "rg_networking" {
  type = string
}

variable "nsg_ids" {
  type = map(string)
  description = "Map of NSG names to NSG IDs"
}

variable "storage_account_id" {
  type = string
}

variable "law_id" {
  type = string
}

variable "law_workspace_id" {
  type = string
}
variable "tags" {
  type = map(string)
  default = {}
}