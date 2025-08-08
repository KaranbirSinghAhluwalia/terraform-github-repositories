terraform {
  required_providers {
    github = {
      source  = "hashicorp/github"
      version = "~> 6.0"
    }
  }
}


provider "github" {
  owner = var.github_owner
  token = var.github_token != "" ? var.github_token : null
}