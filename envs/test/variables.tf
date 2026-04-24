variable "prefix" {
  type        = string
  description = "Prefix for all resources in the landing zone."
}
variable "location" {
  type        = string
  description = "Azure region for the resources."
}
/*variable "tags" {
  type = map(string)
} */
variable "global_tags" {
  type        = map(string)
  description = "Global tags to apply to all resources in the landing zone."
}

variable "environment_tags" {
  type        = map(string)
  description = "Tags specific to the environment."
}
