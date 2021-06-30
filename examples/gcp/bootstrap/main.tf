variable "name_prefix" {}
variable "gcp_project" {}
variable "enable_services" {
  default = true
}

module "bootstrap" {
  source = "git::https://github.com/GaloyMoney/galoy-infra.git//modules/bootstrap/gcp?ref=d09002b"

  name_prefix = var.name_prefix
  gcp_project = var.gcp_project
  enable_services = var.enable_services
}
