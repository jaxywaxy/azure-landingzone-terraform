variable "prefix" {
  type        = string
  description = "Prefix used for naming logging resources."
}

variable "location" {
  type        = string
  description = "Azure region for logging resources."
}

variable "rg_logging" {
  type        = string
  description = "Resource group where logging resources will be deployed."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags to apply to supported logging resources."
}
