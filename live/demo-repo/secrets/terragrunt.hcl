include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules/secrets"
}

dependencies {
  paths = ["../repository"]
}

inputs = {
  repo_name = "terraform-repo"
  secrets = {
    MY_SECRET = "supersecret"
  }
}
