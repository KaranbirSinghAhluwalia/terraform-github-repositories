variable "github_token" {
  type      = string
  sensitive = true
}

variable "github_owner" {
  type = string
}

variable "repo_name" {
  type = string
}

variable "branch_protections" {
  type = list(object({
    pattern                       = string
    enforce_admins                = optional(bool)
    required_pull_request_reviews = optional(object({
      required_approving_review_count = number
    }))
    allow_force_pushes           = optional(bool)
    allow_deletions              = optional(bool)
  }))
  default = []
}
