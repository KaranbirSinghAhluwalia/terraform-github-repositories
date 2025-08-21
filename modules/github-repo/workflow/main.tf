resource "github_repository_file" "ci_workflow" {
  repository          = var.repo_name
  file                = ".github/workflows/ci.yaml"
  content             = lookup(var.workflows, var.project_type, var.workflows["terraform"])
  branch              = "main"
  commit_message      = "Add CI workflow"
  overwrite_on_create = true
}
