variable "prefix" {
  description = "Prefix for all resources in the landing zone."
  type        = string
}

variable "location" {
  description = "Azure region for the resources."
  type        = string
}

/*variable "tags" {
  type = map(string)
} */
variable "global_tags" {
  description = "Global tags to apply to all resources in the landing zone."
  type        = map(string)
}

variable "environment_tags" {
  description = "Tags specific to the environment."
  type        = map(string)
}
