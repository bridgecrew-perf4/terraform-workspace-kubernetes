data "digitalocean_kubernetes_versions" "this" {

}

resource "digitalocean_kubernetes_cluster" "main" {
  auto_upgrade  = false
  # ha            = true
  name          = "main"
  region        = var.do_region
  surge_upgrade = true
  version       = data.digitalocean_kubernetes_versions.this.latest_version

  node_pool {
    auto_scale = true
    min_nodes  = 1
    max_nodes  = 3
    name       = "shared-pool"
    size       = "s-2vcpu-4gb"

    labels = {
      "env" = "shared"
    }
  }
}
# resource "digitalocean_kubernetes_node_pool" "monitoring" {
#   cluster_id = digitalocean_kubernetes_cluster.main.id

#   auto_scale = true
#   min_nodes  = 1
#   max_nodes  = 5
#   name       = "monitoring-pool"
#   size       = "s-1vcpu-2gb"

#   labels = {
#     "env" = "monitoring"
#   }
# }
resource "digitalocean_kubernetes_node_pool" "dev" {
  cluster_id = digitalocean_kubernetes_cluster.main.id

  auto_scale = true
  min_nodes  = 1
  max_nodes  = 5
  name       = "dev-pool"
  size       = "s-1vcpu-2gb"

  labels = {
    "env" = "dev"
  }
}
# resource "digitalocean_kubernetes_node_pool" "prod" {
#   cluster_id = digitalocean_kubernetes_cluster.main.id

#   auto_scale = true
#   min_nodes  = 1
#   name       = "prod-pool"
#   size       = "s-1vcpu-2gb"

#   labels = {
#     "env" = "prod"
#   }
# }

resource "digitalocean_project_resources" "clusters" {
  project = data.digitalocean_project.this.id
  resources = [
    digitalocean_kubernetes_cluster.main.urn,
  ]
}
