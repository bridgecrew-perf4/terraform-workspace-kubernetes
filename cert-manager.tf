resource "kubernetes_namespace" "cert_manager" {
  metadata {
    name = "cert-manager"
  }
}
resource "kubernetes_secret" "cert_manager" {
  metadata {
    name      = "from-terraform"
    namespace = kubernetes_namespace.cert_manager.id
  }

  data = {
    "digitalocean-token" = data.terraform_remote_state.project.outputs.digitalocean_token
  }
}
