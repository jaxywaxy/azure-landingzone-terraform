variable "prefix" {
  type = string
}

variable "location" {
  type = string
}

variable "tags" {
  type = map(string)
}
variable "global_tags" {
  type = map(string)
}

variable "environment_tags" {
  type = map(string)
}
