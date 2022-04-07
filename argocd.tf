resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
  }
}
resource "kubernetes_secret" "argocd_sh_248_argocd" {
  metadata {
    name      = "sh-248-argocd"
    namespace = kubernetes_namespace.argocd.id
    labels = {
      "argocd.argoproj.io/secret-type" = "repo-creds"
    }
  }

  data = {
    url           = "git@github.com:248-sh/sh-248-argocd.git"
    sshPrivateKey = var.argocd_repo_creds_private_key
  }
}
