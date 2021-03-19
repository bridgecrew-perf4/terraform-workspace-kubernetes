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
data "google_compute_zones" "this" {
  project = local.gcp_project_id
  region  = local.gcp_region
}

data "google_container_engine_versions" "this" {
  # count = length(data.google_compute_zones.this.names)
  for_each = toset(data.google_compute_zones.this.names)

  # location = data.google_compute_zones.this.names[count.index]
  location = each.key
}
