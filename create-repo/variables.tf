variable "github_token" {
  description = "GitHub personal access token"
  type        = string
  sensitive   = true
}

variable "github_owner" {
  description = "GitHub organization or username"
  type        = string
}

variable "repositories" {
  description = "List of repositories and their configurations"
  type = list(object({
    name         = string
    description  = optional(string)
    visibility   = optional(string)
    topics       = optional(list(string))

    collaborators = optional(list(object({
      username   = string
      permission = string
    })))

    branch_protections = optional(list(object({
      pattern        = string
      enforce_admins = optional(bool)
      required_pull_request_reviews = optional(object({
        required_approving_review_count = number
      }))
      allow_force_pushes = optional(bool)
      allow_deletions    = optional(bool)
    })))

    secrets = optional(map(string))
  }))
}
