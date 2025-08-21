variable "repo_name" {
  description = "The name of the repository to apply branch protection to."
  type        = string
}

variable "branch_protections" {
  description = <<EOT
List of branch protection rules.  
Each rule is an object with the following attributes:

- pattern (string) → Branch name pattern (e.g., "main").
- enforce_admins (bool, optional) → Whether admins must follow rules (default: true).
- allow_force_pushes (bool, optional) → Allow force pushes (default: false).
- allow_deletions (bool, optional) → Allow branch deletions (default: false).
- require_linear_history (bool, optional) → Enforce linear commit history (default: true).
- required_checks (list(string), optional) → List of required status checks (default: []).
- required_pull_request_reviews (object, optional):
  - required_approving_review_count (number) → Required approving reviews (default: 1).
- push_restricted_users (list(string), optional) → Users allowed to push (default: []).
- push_restricted_teams (list(string), optional) → Teams allowed to push (default: []).
EOT

  type = list(object({
    pattern        = string
    enforce_admins = optional(bool, true)

    allow_force_pushes     = optional(bool, false)
    allow_deletions        = optional(bool, false)
    require_linear_history = optional(bool, true)

    required_checks = optional(list(string), [])

    required_pull_request_reviews = optional(object({
      required_approving_review_count = optional(number, 1)
    }), {})

    push_restricted_users = optional(list(string), [])
    push_restricted_teams = optional(list(string), [])
  }))
  default = []
}
