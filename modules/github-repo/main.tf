# modules/github-repo/main.tf
module "repository" {
  source           = "./repository"
  repo_name        = var.repo_name
  repo_description = var.repo_description
  repo_visibility  = var.repo_visibility
  repo_topics      = var.repo_topics
}

# Create branch protection rules
module "branch_protection" {
  source             = "./branch-protection"
  repo_name          = module.repository.repo_name
  branch_protections = var.branch_protections
}

# Add collaborators to the repository
module "collaborators" {
  source        = "./collaborators"
  repo_name     = module.repository.repo_name
  collaborators = var.collaborators
}

# Create a README file
module "readme" {
  source    = "./readme"
  repo_name = module.repository.repo_name
}

# Create a CI workflow file
module "workflow" {
  source    = "./workflow"
  repo_name = module.repository.repo_name
  project_type = var.project_type
} 

# Add repository secrets
module "secrets" {
  source    = "./secrets"
  repo_name = module.repository.repo_name
  secrets   = var.secrets
}
