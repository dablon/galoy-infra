output "cluster_ca_cert" {
  value = base64decode(google_container_cluster.primary.master_auth.0.cluster_ca_certificate)
}

output "master_endpoint" {
  value = "https://${google_container_cluster.primary.private_cluster_config.0.private_endpoint}"
}

output "cluster_name" {
  value = google_container_cluster.primary.name
}

output "cluster_location" {
  value = google_container_cluster.primary.location
}

output "lnd1_ip" {
  value = google_compute_address.lnd1.address
}

output "lnd2_ip" {
  value = google_compute_address.lnd2.address
}

output "lnd1_internal_ip" {
  value = google_compute_address.lnd1_internal_ip.address
}

output "lnd2_internal_ip" {
  value = google_compute_address.lnd2_internal_ip.address
}

output "shared_pg_host" {
  value = local.deploy_shared_pg ? module.shared_pg.0.private_ip : ""
}

output "shared_pg_admin_username" {
  value = local.deploy_shared_pg ? module.shared_pg.0.admin_username : ""
}

output "shared_pg_admin_password" {
  value     = local.deploy_shared_pg ? module.shared_pg.0.admin_password : ""
  sensitive = true
}

output "shared_pg_instance_name" {
  value = local.deploy_shared_pg ? module.shared_pg.0.instance_name : ""
}

output "shared_pg_connection_name" {
  value = local.deploy_shared_pg ? module.shared_pg.0.connection_name : ""
}

output "auth_pg_instance_name" {
  value = local.deploy_auth_pg ? module.auth_pg.0.instance_name : ""
}

output "auth_pg_host" {
  value = local.deploy_auth_pg ? module.auth_pg.0.private_ip : ""
}

output "auth_pg_admin_username" {
  value = local.deploy_auth_pg ? module.auth_pg.0.admin_username : ""
}

output "auth_pg_admin_password" {
  value     = local.deploy_auth_pg ? module.auth_pg.0.admin_password : ""
  sensitive = true
}

output "auth_pg_connection_name" {
  value = local.deploy_auth_pg ? module.auth_pg.0.connection_name : ""
}
