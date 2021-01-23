resource "google_container_cluster" "main" {
  initial_node_count       = 1
  location                 = local.gcp_region
  min_master_version       = "1.18.12-gke.1205"
  name                     = "main"
  network                  = "default"
  remove_default_node_pool = true
  subnetwork               = "default"

  addons_config {
    http_load_balancing {
      disabled = true
    }
    horizontal_pod_autoscaling {
      disabled = false
    }
    network_policy_config {
      disabled = true
    }
  }
  cluster_autoscaling {
    enabled = true
    resource_limits {
      resource_type = "cpu"
      maximum       = 10
      minimum       = 1
    }
    resource_limits {
      resource_type = "memory"
      maximum       = 64
      minimum       = 1
    }
  }
  ip_allocation_policy {
    cluster_ipv4_cidr_block  = "/16"
    services_ipv4_cidr_block = "/22"
  }
  release_channel {
    channel = "RAPID"
  }
  timeouts {
    create = "45m"
    update = "45m"
    delete = "45m"
  }
}

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
    machine_type = "n1-standard-1"
    preemptible  = true

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
