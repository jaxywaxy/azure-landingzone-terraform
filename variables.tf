variable "prefix" {
  type        = string
  description = "Prefix for all resource names"
}

variable "location" {
  type        = string
  description = "Azure region for deployment"
  default     = "australiaeast"
}
variable "rg_network" {
  type        = string
  description = "Resource group for networking resources"
}

