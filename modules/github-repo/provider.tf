
terraform {
  required_providers {
    github = {
      source = "integrations/github"
      version = "6.6.0"
    }
  }
}

provider "github" {
  owner = env("GITHUB_OWNER")

  app_auth {
    id              = 1782237
    installation_id = 80950058
    pem_file        = "${get_env("GITHUB_WORKSPACE")}/app.pem"
  }
}