variable "prefix" {
  type        = string
  description = "Prefix used for naming Network Watcher resources."
}

variable "location" {
  type        = string
  description = "Azure region for Network Watcher and Flow Logs."
}

variable "rg_networking" {
  type        = string
  description = "Resource group where Network Watcher will be deployed."
}

variable "nsg_ids" {
  type        = map(string)
  description = "Map of NSG names to their resource IDs for enabling flow logs."
}

variable "storage_account_id" {
  type        = string
  description = "Resource ID of the storage account used for NSG flow logs."
}

variable "law_id" {
  type        = string
  description = "Resource ID of the Log Analytics Workspace."
}

variable "law_workspace_id" {
  type        = string
  description = "Workspace ID (GUID) of the Log Analytics Workspace."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags to apply to supported resources (Network Watcher does not support tags)."
}
