resource "kubernetes_namespace" "cockroach" {
  metadata {
    name = "cockroach"
  }
}
