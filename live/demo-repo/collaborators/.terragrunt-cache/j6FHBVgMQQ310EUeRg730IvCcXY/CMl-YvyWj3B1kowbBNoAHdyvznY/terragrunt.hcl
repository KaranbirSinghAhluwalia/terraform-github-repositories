include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules/collaborators"
}

dependencies {
  paths = ["../repository"]
}

inputs = {
  repo_name = "terraform-repo"
  collaborators = [
    { username = "dgeorgievski", permission = "admin" }
  ]
}
