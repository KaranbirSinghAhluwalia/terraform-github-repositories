resource "github_repository_file" "ci_workflow" {
  repository          = var.repo_name
  file                = ".github/workflows/ci.yaml"
  content             = <<EOT
name: CI

on:
  push:
    branches: [ "main" ]
  pull_request:
    branches: [ "main" ]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Set up Terraform
        uses: hashicorp/setup-terraform@v2
      - name: Terraform Format
        run: terraform fmt -check
      - name: Terraform Init
        run: terraform init
      - name: Terraform Validate
        run: terraform validate
EOT
  branch              = "main"
  commit_message      = "Add CI workflow"
  overwrite_on_create = true
}
