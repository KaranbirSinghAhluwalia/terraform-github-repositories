
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
    pem_file        = var.app_pem_path != "" ? "../../app.pem" : getenv("APP_PEM_PATH")
  }
}