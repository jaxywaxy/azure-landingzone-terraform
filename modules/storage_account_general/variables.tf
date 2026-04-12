variable "prefix" {}
variable "suffix" {}
variable "location" {}
variable "rg_name" {}
variable "containers" {
  type    = list(string)
  default = []
}
variable "tags" {
  type = map(string)
}
