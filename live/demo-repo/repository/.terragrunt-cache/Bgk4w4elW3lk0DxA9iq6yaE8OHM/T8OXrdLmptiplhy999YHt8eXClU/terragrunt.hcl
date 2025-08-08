include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules/github-repository"
}

inputs = {
  repo_name        = "terraform-repo"
  repo_description = "Terraform managed repo one"
  repo_visibility  = "private"
  repo_topics      = ["terraform", "iac"]
}
