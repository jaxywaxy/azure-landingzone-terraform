variable "resource_name" {
  type        = string
  description = "Name of the resource for naming the diagnostic setting."
}

variable "resource_type" {
  type        = string
  description = "Azure resource type (e.g., Microsoft.Storage/storageAccounts)."
}

variable "target_resource_id" {
  type        = string
  description = "Resource ID of the target resource."
  type        = string
  description = "Resource ID of the target resource."
}

variable "law_id" {
  type        = string
  description = "Log Analytics Workspace ID."
  type        = string
  description = "Log Analytics Workspace ID."
}

variable "logs" {
  type        = list(string)
  description = "Requested log categories."
  default     = []
  type        = list(string)
  description = "Requested log categories."
  default     = []
}

variable "metrics" {
  type        = list(string)
  description = "Requested metric categories."
  default     = []
}

variable "retention_enabled" {
  type        = bool
  default     = false
}

variable "retention_days" {
  type        = number
  default     = 30
}

variable "eventhub_name" {
  type        = string
  default     = null
}

variable "eventhub_auth_rule_id" {
  type        = string
  default     = null
}

variable "archive_storage_id" {
  type        = string
  default     = null
  type        = list(string)
  description = "Requested metric categories."
  default     = []
}

variable "retention_enabled" {
  type        = bool
  default     = false
}

variable "retention_days" {
  type        = number
  default     = 30
}

variable "eventhub_name" {
  type        = string
  default     = null
}

variable "eventhub_auth_rule_id" {
  type        = string
  default     = null
}

variable "archive_storage_id" {
  type        = string
  default     = null
}
