variable "scope" {
  description = "Scope of the policy assignment: subscription, management_group, or resource_group"
  type        = string

  validation {
    condition     = contains(["subscription", "management_group", "resource_group"], var.scope)
    error_message = "Scope must be one of: subscription, management_group, resource_group."
  }
}

variable "name" {
  description = "Name of the policy assignment"
  type        = string
}

variable "policy_definition_id" {
  description = "ID of the policy definition to assign"
  type        = string
}

variable "subscription_id" {
  description = "Subscription ID (required for subscription scope)"
  type        = string
  default     = null
}

variable "management_group_id" {
  description = "Management group ID (required for management_group scope)"
  type        = string
  default     = null
}

variable "resource_group_id" {
  description = "Resource group ID (required for resource_group scope)"
  type        = string
  default     = null
}

variable "display_name" {
  description = "Display name for the assignment"
  type        = string
  default     = null
}

variable "description" {
  description = "Description for the assignment"
  type        = string
  default     = null
}

variable "parameters" {
  description = "Policy parameters"
  type        = map(any)
  default     = {}
}

variable "enforce" {
  description = "Whether to enforce the policy"
  type        = bool
  default     = true
}
