terraform {
  source = "../modules/github-repo"
}

inputs = {
  github_owner = "Platform-management"
  github_token = get_env("GITHUB_TOKEN")
}