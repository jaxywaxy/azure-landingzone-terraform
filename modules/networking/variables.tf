variable "prefix" {
  type = string
}

variable "location" {
  type = string
}

variable "rg_network" {
  type = string
}
variable "tags" {
  type    = map(string)
  default = {}
}
