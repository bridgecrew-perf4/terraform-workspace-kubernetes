terraform {
  backend "remote" {
    organization = "248-sh"

    workspaces {
      name = "workspace-kubernetes"
    }
  }
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
  }
  required_version = ">= 1"
}
