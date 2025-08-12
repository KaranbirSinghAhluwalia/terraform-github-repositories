# GitHub Repository Management with Terraform + Terragrunt

This project manages GitHub repositories, branch protections, collaborators, and secrets using Terraform modules, orchestrated by Terragrunt.

## 📂 Folder Structure

```
live/
└── demo-repo/
    └── terragrunt.hcl     
└── terragrunt.hcl    
modules/
└── github-repo/             
    ├── repository/
    ├── branch-protection/
    ├── collaborators/
    └── secrets/
    └── main.tf
    └── provider.tf
    └── variable.tf
    └── output.tf

```

**Modules Overview:**
- **repository** → Creates and configures a GitHub repository.
- **branch-protection** → Sets branch protection rules.
- **collaborators** → Adds repository collaborators with permissions.
- **secrets** → Creates repository secrets.

---

## 🔑 Provider Configuration

The provider is defined at the root:

```hcl
terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "6.6.0"
    }
  }
}

provider "github" {
  owner = var.github_owner
  token = var.github_token != "" ? var.github_token : null
}
```

---

## ⚙️ Variables

```hcl
variable "github_owner" {
  description = "GitHub organization or user name to own the repositories"
  type        = string
}

variable "github_token" {
  description = "GitHub personal access token with repo permissions"
  type        = string
  sensitive   = true
}
```

---

## 🏗 Example Terragrunt Configuration

`live/demo-repo/terragrunt.hcl`:

```hcl
terraform {
  source = "../../modules/github-repo"
}

inputs = {
  repo_name      = "terraform-repo"
  repo_description = "Terraform managed repo"
  repo_visibility  = "private"
  repo_topics      = ["terraform", "iac"]

  branch_protections = [
    {
      pattern        = "main"
      enforce_admins = true
      required_pull_request_reviews = {
        required_approving_review_count = 1
      }
    }
  ]

  collaborators = [
    { username = "octocat", permission = "admin" }
  ]

  secrets = {
    MY_SECRET = "supersecret"
  }
}
```

---

## 🚀 Running

**Change directory:**
```bash
cd live
```

**Initialize Terragrunt/Terraform:**
```bash
terragrunt init
```

**Plan changes:**
```bash
terragrunt plan
```

**Apply changes:**
```bash
terragrunt apply
```

---

## 🛠 Notes
- Your **GitHub Personal Access Token** must have `repo` and `admin:repo_hook` scopes.
- The `github_owner` can be either a **username** (personal repos) or **organization name** (org repos).
- To avoid committing secrets, pass `github_token` via environment variable:
```bash
export TG_VAR_github_token="ghp_XXXXXXXXXXXXXXXXXXXX"
```
