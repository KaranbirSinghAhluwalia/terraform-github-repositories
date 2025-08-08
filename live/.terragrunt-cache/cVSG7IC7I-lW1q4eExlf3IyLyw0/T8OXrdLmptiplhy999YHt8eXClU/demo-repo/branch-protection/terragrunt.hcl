include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules/branch-protection"
}

dependencies {
  paths = ["../repository"]
}

inputs = {
  repo_name = "terraform-repo"
  branch_protections = [
    {
      pattern        = "main"
      enforce_admins = true
      required_pull_request_reviews = {
        required_approving_review_count = 1
      }
      allow_force_pushes = false
      allow_deletions    = false
    }
  ]
}
