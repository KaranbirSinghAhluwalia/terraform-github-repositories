resource "github_repository_file" "readme" {
  repository          = var.repo_name
  file                = "README.md"
  depends_on          = [var.branch_depends_on]
  content             = <<EOT
# ${var.repo_name}

This repository is managed entirely with **Terraform** and follows **Infrastructure as Code (IaC)** best practices.  

---

## 📌 Project Overview
The **${var.repo_name}** project is part of the *prodcument-management* initiative.  
Its purpose is to maintain and automate build and deploy setup using CI/CD pipelines.

---

## 🚀 Features
- Branch protection rules enforcing GitHub Flow
- Role-based access via collaborators
- CI/CD pipeline integration with GitHub Actions to build, test, and deploy
- Secure secret management

---

## 🛠️ Development Workflow
We follow **GitHub Flow**:
1. Create a feature branch from `main`
2. Commit changes and push
3. Open a Pull Request
4. Ensure CI checks and review approvals pass
5. Merge into `main`

---

## ⚙️ Continuous Integration
This repo includes a CI workflow in [`.github/workflows/ci.yaml`](.github/workflows/ci.yaml) which runs:
- build and test on every push and pull request
- Execute codeQL analysis for security vulnerabilities
- Create a docker image and push to the registry

---

## 📄 License
This repository uses the **MIT License**.

---
EOT  
  branch              = var.branch_name
  commit_message      = "Add README.md"
  overwrite_on_create = true
}