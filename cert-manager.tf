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
    "digitalocean-token" = var.do_token
  }
}
