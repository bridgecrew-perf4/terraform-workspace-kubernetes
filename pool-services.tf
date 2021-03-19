resource "google_container_node_pool" "services" {
  cluster            = google_container_cluster.main.name
  initial_node_count = 1
  location           = local.gcp_region
  name               = "pool-services"

  autoscaling {
    min_node_count = 1
    max_node_count = 2
  }
  management {
    auto_repair  = true
    auto_upgrade = true
  }
  node_config {
    disk_size_gb = 10
    disk_type    = "pd-standard"
    machine_type = "n1-standard-2"
    preemptible  = true

    labels = {
      "node_pool" = "pool-services"
    }
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/ndev.clouddns.readwrite",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/trace.append",
    ]
  }
}
