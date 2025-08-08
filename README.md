# terraform-github-repositories# Terraform GitHub Repository Module

A reusable Terraform module that creates and manages a GitHub repository using the [Mineiros GitHub module](https://github.com/mineiros-io/terraform-github-repository).

## Features

- Create public/private GitHub repositories
- Set topics, descriptions, and license
- Enable/disable issues, wiki, and projects
- Configure merge settings

## Usage

```hcl
provider "github" {
  token = var.github_token
  owner = var.github_owner
}

module "repository" {
  source  = "path/to/this/module"

  repo_name        = "my-repo"
  repo_description = "Managed by Terraform"
  repo_visibility  = "public"
  repo_topics      = ["terraform", "iac"]
}
```

## Inputs

| Name             | Type        | Default     | Description                          |
|------------------|-------------|-------------|--------------------------------------|
| `github_token`   | `string`    | n/a         | GitHub personal access token         |
| `github_owner`   | `string`    | n/a         | GitHub organization or username      |
| `repo_name`      | `string`    | n/a         | Name of the repository               |
| `repo_description` | `string`  | `""`        | Description of the repository        |
| `repo_visibility` | `string`   | `"private"` | Visibility of the repository         |
| `repo_topics`    | `list(string)` | `[]`     | Topics to tag the repository with    |

## Outputs

| Name             | Description                     |
|------------------|---------------------------------|
| `repository_url` | URL of the created repository   |

## License

MIT