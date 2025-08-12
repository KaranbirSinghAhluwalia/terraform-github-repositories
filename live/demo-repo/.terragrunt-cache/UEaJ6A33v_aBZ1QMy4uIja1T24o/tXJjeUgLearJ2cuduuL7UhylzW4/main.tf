module "repository" {
  source           = "./repository"
  repo_name        = var.repo_name
  repo_description = var.repo_description
  repo_visibility  = var.repo_visibility
  repo_topics      = var.repo_topics
}

module "branch_protection" {
  source             = "./branch-protection"
  repo_name          = module.repository.repo_name
  branch_protections = var.branch_protections
}

module "collaborators" {
  source        = "./collaborators"
  repo_name     = module.repository.repo_name
  collaborators = var.collaborators
}

module "secrets" {
  source  = "./secrets"
  repo_name = module.repository.repo_name
  secrets = var.secrets
}
