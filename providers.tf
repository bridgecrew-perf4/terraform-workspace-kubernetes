provider "digitalocean" {
  token = var.do_token
}

provider "kubernetes" {
  cluster_ca_certificate = base64decode(digitalocean_kubernetes_cluster.main.kube_config[0].cluster_ca_certificate)
  host                   = digitalocean_kubernetes_cluster.main.endpoint
  token                  = digitalocean_kubernetes_cluster.main.kube_config[0].token
}