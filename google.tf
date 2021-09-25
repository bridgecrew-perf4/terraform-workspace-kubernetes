# resource "google_container_cluster" "main" {
#   initial_node_count       = 1
#   location                 = local.gcp_region
#   min_master_version       = "1.19.7-gke.1500"
#   # min_master_version       = "1.20.4-gke.400"
#   name                     = "main"
#   network                  = "default"
#   # networking_mode          = "VPC_NATIVE"
#   remove_default_node_pool = true
#   subnetwork               = "default"

#   logging_service    = "none"
#   monitoring_service = "none"

#   addons_config {
#     http_load_balancing {
#       disabled = true
#     }
#     horizontal_pod_autoscaling {
#       disabled = false
#     }
#     network_policy_config {
#       disabled = true
#     }
#   }
#   cluster_autoscaling {
#     enabled = true
#     resource_limits {
#       resource_type = "cpu"
#       maximum       = 10
#       minimum       = 1
#     }
#     resource_limits {
#       resource_type = "memory"
#       maximum       = 64
#       minimum       = 1
#     }
#   }
#   ip_allocation_policy {
#     cluster_ipv4_cidr_block  = "/14"
#     services_ipv4_cidr_block = "/20"
#   }
#   release_channel {
#     channel = "RAPID"
#   }
#   timeouts {
#     create = "45m"
#     update = "45m"
#     delete = "45m"
#   }
#   workload_identity_config {
#     identity_namespace = "${local.gcp_project_id}.svc.id.goog"
#   }
# }

# resource "google_container_node_pool" "services" {
#   cluster            = google_container_cluster.main.name
#   initial_node_count = 1
#   location           = local.gcp_region
#   name               = "pool-services"

#   autoscaling {
#     min_node_count = 1
#     max_node_count = 2
#   }
#   management {
#     auto_repair  = true
#     auto_upgrade = true
#   }
#   node_config {
#     disk_size_gb = 10
#     disk_type    = "pd-standard"
#     machine_type = "n1-standard-2"
#     preemptible  = true

#     labels = {
#       "node_pool" = "pool-services"
#     }
#     oauth_scopes = [
#       "https://www.googleapis.com/auth/cloud-platform",
#       "https://www.googleapis.com/auth/devstorage.read_only",
#       "https://www.googleapis.com/auth/logging.write",
#       "https://www.googleapis.com/auth/monitoring",
#       "https://www.googleapis.com/auth/ndev.clouddns.readwrite",
#       "https://www.googleapis.com/auth/service.management.readonly",
#       "https://www.googleapis.com/auth/servicecontrol",
#       "https://www.googleapis.com/auth/trace.append",
#     ]
#   }
# }
