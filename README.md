# GitHub Terraform Management

This repository manages GitHub repositories, collaborators, and branch protection using Terraform and Terragrunt.

## Structure

```
.
├── live/
│   └── demo-repo/
│       ├── repository/
│       ├── collaborators/
│       └── branch-protection/
└── modules/
    ├── github-repository/
    ├── github-collaborators/
    └── github-branch-protection/
```

## Getting Started

### Prerequisites

- Terraform >= 1.3
- Terragrunt >= 0.48
- GitHub PAT (Personal Access Token) with:
  - `repo`
  - `admin:org`
  - `workflow` (optional)

### Environment Setup

Export your GitHub token:

```bash
export GITHUB_TOKEN="your_token"
```

### Commands

Initialize:

```bash
cd live/demo-repo
terragrunt init
```

Plan:

```bash
terragrunt plan-all
```

Apply:

```bash
terragrunt apply-all
```

---

## Modules

- `github-repository`: Creates the GitHub repository.
- `github-collaborators`: Adds collaborators with appropriate permissions.
- `github-branch-protection`: Configures branch protection rules.

---

## License

MIT © Karanbir