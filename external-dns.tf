resource "kubernetes_namespace" "external_dns" {
  metadata {
    name = "external-dns"
  }
}
resource "kubernetes_secret" "external_dns" {
  metadata {
    name      = "from-terraform"
    namespace = kubernetes_namespace.external_dns.id
  }

  data = {
    "digitalocean-token" = data.terraform_remote_state.project.outputs.digitalocean_token
  }
}
