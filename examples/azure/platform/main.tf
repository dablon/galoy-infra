variable "name_prefix" {
}
variable "network_prefix" {
  default = "10.0"
}
variable "resource_group_name" {
}
variable "node_default_machine_type" {
  default = "Standard_DS2_v2"
}
variable "vnet_name" {}
variable "cluster_name" {
  default = "cluster"
}
variable "cluster_location" {
  default = "eastus"
}

module "platform" {
  #source = "git::https://github.com/GaloyMoney/galoy-infra.git//modules/platform/gcp?ref=79033f0"
  source = "../../../modules/platform/azure"

  name_prefix               = var.name_prefix
  network_prefix            = var.network_prefix
  resource_group_name       = var.resource_group_name
  node_default_machine_type = var.node_default_machine_type
  vnet_name                 = var.vnet_name
  cluster_name              = var.cluster_name
  cluster_location          = var.cluster_location
}

output "client_certificate" {
  value     = module.platform.client_certificate
  sensitive = true
}

output "kube_config" {
  value     = module.platform.kube_config
  sensitive = true
}

output "cluster_name" {
  value = module.platform.cluster_name
}
