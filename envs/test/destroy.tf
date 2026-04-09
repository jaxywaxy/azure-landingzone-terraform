module "destroy" {
  source = "../../modules/destroy"
  environment         = "prod"
  location            = var.location
}
