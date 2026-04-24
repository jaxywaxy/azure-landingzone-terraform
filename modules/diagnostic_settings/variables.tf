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
}

variable "law_id" {
  type        = string
  description = "Log Analytics Workspace ID."
}

variable "logs" {
  type        = list(string)
  description = "Requested log categories."
  default     = []
}

variable "metrics" {
  type        = list(string)
  description = "Requested metric categories."
  default     = []
}
variable "eventhub_name" {
  type        = string
  description = "Name of the Event Hub to send diagnostics to."
  default     = null
}

variable "eventhub_auth_rule_id" {
  type        = string
  description = "Resource ID of the Event Hub authorization rule for diagnostics to use."
  default     = null
}
variable "archive_storage_id" {
  type        = string
  description = "Resource ID of the storage account for archiving diagnostics."
  default     = null
}
