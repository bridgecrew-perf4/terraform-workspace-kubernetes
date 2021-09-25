locals {
  do_project_id = data.terraform_remote_state.project.outputs.digitalocean_project.this.id
  do_region     = "fra1" # frankfurt
  gcp_project_id = data.terraform_remote_state.project.outputs.google_project.this.project_id
  gcp_region     = "europe-west3" # frankfurt
  # gcp_region     = "asia-northeast1" # tokyo
}
