resource "github_repository" "repo" {

  name               = var.repo_name
  description        = var.repo_description
  visibility         = var.repo_visibility
  license_template   = "mit"
  gitignore_template = "Terraform"
  topics             = var.repo_topics
  has_issues         = true
  has_projects       = false
  has_wiki           = false
  auto_init          = true
  allow_squash_merge = true
  allow_merge_commit = false
  allow_rebase_merge = false
}