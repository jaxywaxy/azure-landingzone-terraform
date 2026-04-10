variable "environment" {
  type        = string
  description = "Environment name (dev, test, prod)."
}

variable "global_tags" {
  type        = map(string)
  description = "Global CAF-aligned tags applied to all resources."
}

variable "environment_tags" {
  type        = map(string)
  description = "Environment-specific tag overrides."
}

variable "resource_tags" {
  type        = map(string)
  description = "Resource-specific tag overrides."
}
