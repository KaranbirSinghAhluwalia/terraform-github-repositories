resource "github_branch" "branch" {
  repository     = var.repo_name
  branch         = var.branch_name
  source_branch  = var.source_branch
}
