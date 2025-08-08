resource "github_repository_collaborator" "collaborators" {
  for_each   = { for c in var.collaborators : c.username => c }

  repository = var.repo_name
  username   = each.key
  permission = each.value.permission
}