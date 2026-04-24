terraform {
  required_version = ">= 1.6.0"
}
locals {
  merged_tags = merge(
    var.global_tags,
    { environment = var.environment },
    var.environment_tags,
    var.resource_tags
  )
}
