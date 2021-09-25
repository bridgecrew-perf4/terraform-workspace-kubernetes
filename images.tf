resource "digitalocean_container_registry_docker_credentials" "app_id" {
  registry_name = "app-id"
}

resource "kubernetes_secret" "app_id" {
  metadata {
    name      = "app-id"
    namespace = "default"
  }

  data = {
    ".dockerconfigjson" = digitalocean_container_registry_docker_credentials.app_id.docker_credentials
  }

  type = "kubernetes.io/dockerconfigjson"
}
