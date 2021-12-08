resource "kubernetes_secret" "default" {
  metadata {
    name      = "from-terraform"
    namespace = "default"
  }

  data = {
    "digitalocean-token" = data.terraform_remote_state.project.outputs.digitalocean_token
  }
}
