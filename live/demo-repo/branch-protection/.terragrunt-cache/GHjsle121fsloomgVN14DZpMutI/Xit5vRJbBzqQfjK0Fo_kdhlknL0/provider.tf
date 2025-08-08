provider "github" {
  token = var.github_token != "" ? var.github_token : null
  owner = var.github_owner
}