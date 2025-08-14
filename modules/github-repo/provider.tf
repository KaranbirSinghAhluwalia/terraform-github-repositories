terraform {
  required_providers {
    github = {
      source = "integrations/github"
      version = "6.6.0"
    }
  }
}

provider "github" {
  owner = env("GITHUB_ORGANIZATION")
  auth {
    id                 = tonumber(env("GITHUB_APP_ID"))
    installation_id    = tonumber(env("GITHUB_APP_INSTALLATION_ID"))
    pem_file           = env("GITHUB_APP_PEM_FILE")
  }
}