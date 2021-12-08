resource "digitalocean_kubernetes_cluster" "main" {
  auto_upgrade  = false
  name          = "main"
  region        = local.do_region
  surge_upgrade = false
  version       = "1.21.5-do.0"

  node_pool {
    auto_scale = true
    min_nodes  = 1
    max_nodes  = 5
    name       = "autoscale-worker-pool"
    size       = "s-1vcpu-2gb"

    labels = {
      "node_pool" = "pool-services"
    }
  }
}
