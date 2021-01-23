terraform {
  backend "remote" {
    organization = "248-sh"

    workspaces {
      name = "workspace-kubernetes"
    }
  }
  required_providers {
    google = {
      source = "hashicorp/google"
    }
    helm = {
      source = "hashicorp/helm"
    }
    kubectl = {
      source = "gavinbunney/kubectl"
    }
  }
  required_version = ">= 0.14"
}
