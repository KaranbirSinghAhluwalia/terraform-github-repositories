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
    app_id                 = tonumber(env("GITHUB_APP_ID"))
    app_installation_id    = tonumber(env("GITHUB_APP_INSTALLATION_ID"))
    app_pem_file           = env("GITHUB_APP_PEM_FILE")
  }
}