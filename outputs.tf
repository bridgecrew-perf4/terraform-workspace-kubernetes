output "gke_main" {
  sensitive = true
  value = {
    endpoint       = google_container_cluster.main.endpoint
    ca_certificate = google_container_cluster.main.master_auth[0].cluster_ca_certificate
  }
}
