output "gke_main" {
  sensitive = true
  value = {
    ca_certificate = google_container_cluster.main.master_auth[0].cluster_ca_certificate
    endpoint       = google_container_cluster.main.endpoint
  }
}

output "available_gke_versions" {
  # value = data.google_container_engine_versions.this

  value = {
    for k, v in data.google_container_engine_versions.this : k => v.release_channel_default_version
  }
}
