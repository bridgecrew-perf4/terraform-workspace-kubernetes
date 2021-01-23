locals {
  gcp_project_id = data.terraform_remote_state.project.outputs.google_project.this.project_id
  gcp_region     = "europe-west3"
}
