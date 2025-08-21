terraform {
  source = "../../modules/github-repo"
}

inputs = {
  repo_name        = "terraform-repo"
  repo_description = "Terraform managed repo one"
  repo_visibility  = "private"
  repo_topics      = ["terraform", "iac"]
  project_type     = "nodejs" 

  branch_protections = [
  {
    pattern        = "main"
    enforce_admins = true

    required_pull_request_reviews = {
      required_approving_review_count = 1
    }

    required_checks = ["ci/test", "ci/lint"]

    allow_force_pushes     = false
    allow_deletions        = false

    push_restricted_users = []
    push_restricted_teams = []
  }
]

  collaborators = [
    { username = "dgeorgievski", permission = "admin" }
  ]

  secrets = {
    MY_SECRET = "supersecret"
  }
}
