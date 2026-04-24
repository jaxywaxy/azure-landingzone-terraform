prefix   = "jacquidev"
location = "australiaeast"

/* tags = {
  environment  = "dev"
  owner        = "jacqui"
  project      = "landingzone"
  costcenter   = "engineering"
  businessunit = "cloud"
  createdby    = "terraform"
  managedby    = "terraform"
} */
global_tags = {
  owner        = "jacqui"
  costcenter   = "engineering"
  project      = "landingzone"
  businessunit = "cloud"
  createdby    = "terraform"
  managedby    = "terraform"
}

environment_tags = {
  service  = "platform"
  workload = "dev-workloads"
}
