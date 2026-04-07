variable "resource_name" {
  type = string
}

variable "target_resource_id" {
  type = string
}

variable "law_id" {
  type = string
}

variable "logs" {
  type    = list(string)
  default = []
}

variable "metrics" {
  type    = list(string)
  default = []
}
variable "tags" {
  type    = map(string)
  default = {}
}
