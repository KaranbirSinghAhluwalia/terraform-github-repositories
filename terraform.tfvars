[
    {
    name         = "repo-one"
    description  = "First repository managed via Terraform"
    visibility   = "private"
    topics       = ["terraform", "iac"]

    collaborators = [
      { username = "alice", permission = "admin" },
      { username = "bob",   permission = "push"  }
    ]

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

    secrets = {}
  },
  {
    name         = "repo-two"
    description  = "Second repository with minimal config"
    visibility   = "public"
    topics       = ["open-source"]

    collaborators      = []
    branch_protections = []
    secrets            = {}
  }
]
