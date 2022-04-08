resource "kubernetes_namespace" "signals" {
  metadata {
    name = "signals"
  }
}
# resource "kubernetes_secret" "signals" {
#   metadata {
#     name      = "from-terraform"
#     namespace = kubernetes_namespace.signals.id
#   }

#   data = {
#     "github-id"     = var.app_id_github_id,
#     "github-secret" = var.app_id_github_secret,
#     "secret"        = var.app_id_secret,
#   }
# }
resource "kubernetes_secret" "signals_ghcr_auth" {
  metadata {
    name      = "from-terraform-ghcr-auth"
    namespace = kubernetes_namespace.signals.id
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
