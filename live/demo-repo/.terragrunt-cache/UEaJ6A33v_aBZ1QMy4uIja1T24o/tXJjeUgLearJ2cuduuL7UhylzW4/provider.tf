terraform {
  required_providers {
    github = {
      source = "integrations/github"
      version = "6.6.0"
    }
  }
}

provider "github" {
  owner = var.github_owner
  auth {
    app_id                 = var.github_app_id
    app_installation_id    = var.github_app_installation_id
    app_pem_file           = var.github_app_pem_file
  }
}