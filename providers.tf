provider "google" {
  credentials = base64decode(data.terraform_remote_state.project.outputs.google_service_account_key.this.private_key)
  project     = local.gcp_project_id
}

provider "helm" {
  kubernetes {
    cluster_ca_certificate = base64decode(module.gke_main.ca_certificate)
    host                   = module.gke_main.endpoint
    token                  = data.google_client_config.this.access_token
  }
}
provider "kubectl" {
  cluster_ca_certificate = base64decode(module.gke_main.ca_certificate)
  host                   = module.gke_main.endpoint
  load_config_file       = false
  token                  = data.google_client_config.this.access_token
}
provider "kubernetes" {
  cluster_ca_certificate = base64decode(module.gke_main.ca_certificate)
  host                   = module.gke_main.endpoint
  load_config_file       = false
  token                  = data.google_client_config.this.access_token
}
