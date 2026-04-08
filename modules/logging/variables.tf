variable "prefix" {
  type = string
}

variable "location" {
  type = string
}

variable "rg_logging" {
  type = string
}
variable "tags" {
  type = map(string)
  default = {}
}
