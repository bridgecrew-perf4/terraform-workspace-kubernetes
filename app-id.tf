resource "kubernetes_namespace" "app_id" {
  metadata {
    name = "app-id"
  }
}
resource "kubernetes_secret" "app_id" {
  metadata {
    name      = "from-terraform"
    namespace = kubernetes_namespace.app_id.id
  }

  data = {
    "github-id"     = var.app_id_github_id,
    "github-secret" = var.app_id_github_secret,
    "secret"        = var.app_id_secret,
  }
}
resource "kubernetes_secret" "app_id_ghcr_auth" {
  metadata {
    name      = "from-terraform-ghcr-auth"
    namespace = kubernetes_namespace.app_id.id
  }

  data = {
    ".dockerconfigjson" = <<EOF
{
  "auths": {
    "ghcr.io": {
      "auth": "${var.ghcr_token}"
    }
  }
}
EOF
  }

  type = "kubernetes.io/dockerconfigjson"
}
