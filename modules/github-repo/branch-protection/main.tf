resource "github_branch_protection_v3" "rules" {
  for_each = { for rule in var.branch_protections : rule.pattern => rule }

  repository = var.repo_name
  branch     = each.key

  enforce_admins        = each.value.enforce_admins
  allows_force_pushes   = each.value.allow_force_pushes
  allows_deletions      = each.value.allow_deletions
  require_linear_history = each.value.require_linear_history

  required_status_checks {
    strict = true
    checks = each.value.required_checks
  }

  required_pull_request_reviews {
    dismiss_stale_reviews            = true
    required_approving_review_count  = each.value.required_pull_request_reviews.required_approving_review_count
  }

  restrictions {
    users = each.value.push_restricted_users
    teams = each.value.push_restricted_teams
  }
}
