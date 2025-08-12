resource "github_branch_protection_v3" "rules" {
  for_each = { for rule in var.branch_protections : rule.pattern => rule }

  repository = var.repo_name
  branch     = each.key

  enforce_admins = lookup(each.value, "enforce_admins", false)
  required_status_checks {
    strict   = false
    checks   = []
  }

  required_pull_request_reviews {
    dismiss_stale_reviews          = true
    required_approving_review_count = lookup(each.value.required_pull_request_reviews, "required_approving_review_count", 1)
  }

  restrictions {
    users = []
    teams = []
  }
}
