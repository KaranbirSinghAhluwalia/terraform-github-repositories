terraform {
  source = "../../modules/github-repo"
}

inputs = {
  repo_name        = "terraform-repo"
  repo_description = "Terraform managed repo one"
  repo_visibility  = "private"
  repo_topics      = ["terraform", "iac"]

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

  collaborators = [
    { username = "dgeorgievski", permission = "admin" }
  ]

  secrets = {
    MY_SECRET = "supersecret"
  }
}
