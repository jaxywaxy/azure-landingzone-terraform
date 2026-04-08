module "destroy" {
  source      = "../../modules/destroy"
  environment = "dev"
  location    = var.location
}
