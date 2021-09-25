resource "kubernetes_secret" "default" {
  metadata {
    name      = "from-terraform"
    namespace = "default"
  }

  data = {
    "digitalocean-token" = data.terraform_remote_state.project.outputs.digitalocean_token
  }
}
resource "kubernetes_secret" "cert_manager" {
  metadata {
    name      = "from-terraform"
    namespace = "cert-manager"
  }

  data = {
    "digitalocean-token" = data.terraform_remote_state.project.outputs.digitalocean_token
  }

  depends_on = [
    kubernetes_namespace.cert_manager,
  ]
}
