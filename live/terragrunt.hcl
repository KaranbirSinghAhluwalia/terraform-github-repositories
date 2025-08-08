terraform {
  source = "../modules/github-repository"
}

inputs = {
  github_owner = "Platform-management"
  github_token = get_env("GITHUB_TOKEN")
}