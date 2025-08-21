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

module "add_readme_branch" {
  source        = "../../modules/github-branch"
  repo_name     = var.repo_name
  branch_name   = "add-readme"
  source_branch = "main"
}


# Create a README file
module "readme" {
  source    = "./readme"
  repo_name = module.repository.repo_name
  branch_name      = module.add_readme_branch.branch_name
  branch_depends_on = [module.add_readme_branch]
}

# Create a CI workflow file
module "workflow" {
  source    = "./workflow"
  repo_name = module.repository.repo_name
  project_type = var.project_type
  branch_name      = module.add_readme_branch.branch_name
  branch_depends_on = [module.add_readme_branch]
} 

# Add repository secrets
module "secrets" {
  source    = "./secrets"
  repo_name = module.repository.repo_name
  secrets   = var.secrets
}
