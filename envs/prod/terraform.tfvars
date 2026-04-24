prefix   = "jacquiprod"
location = "australiaeast"

/* tags = {
  environment  = "prod"
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
  workload = "prod-workloads"
}
