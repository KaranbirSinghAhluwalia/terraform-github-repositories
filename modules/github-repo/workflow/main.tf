resource "github_repository_file" "ci_workflow" {
  repository          = var.repo_name
  file                = ".github/workflows/ci.yaml"
  depends_on          = [var.branch_depends_on] 
  content             = var.workflows[var.project_type]
  branch              = var.branch_name
  commit_message      = "Add CI workflow"
  overwrite_on_create = true
}
