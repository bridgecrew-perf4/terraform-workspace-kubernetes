data "terraform_remote_state" "dns" {
  backend = "remote"

  config = {
    organization = "248-sh"
    workspaces = {
      name = "workspace-dns"
    }
  }
}
data "terraform_remote_state" "project" {
  backend = "remote"

  config = {
    organization = "248-sh"
    workspaces = {
      name = "workspace-project"
    }
  }
}

data "google_client_config" "this" {

}
data "google_compute_zones" "available" {
  project = local.gcp_project_id
  region  = local.gcp_region
}
