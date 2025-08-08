locals {
  repos = var.repositories
}

module "repositories" {
  source     = "../modules/github-repository"
  for_each   = { for repo in local.repos : repo.name => repo }

  github_token     = var.github_token
  github_owner     = var.github_owner
  repo_name        = each.value.name
  repo_description = each.value.description
  repo_visibility  = each.value.visibility
  repo_topics      = each.value.topics
}

module "collaborators" {
  source     = "../modules/collaborators"
  for_each   = { for repo in local.repos : repo.name => repo }

  github_token  = var.github_token
  github_owner  = var.github_owner
  repo_name     = each.value.name
  collaborators = each.value.collaborators
  depends_on    = [module.repositories]
}

module "branch_protections" {
  source     = "../modules/branch-protection"
  for_each   = { for repo in local.repos : repo.name => repo }

  github_token        = var.github_token
  github_owner        = var.github_owner
  repo_name           = each.value.name
  branch_protections  = each.value.branch_protections
  depends_on          = [module.repositories]
}

module "secrets" {
  source     = "../modules/secrets"
  for_each   = { for repo in local.repos : repo.name => repo }

  github_token = var.github_token
  github_owner = var.github_owner
  repo_name    = each.value.name
  secrets      = each.value.secrets
  depends_on   = [module.repositories]
}
