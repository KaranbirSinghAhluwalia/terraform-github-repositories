output "repository_url" {
  description = "The GitHub repository URL"
  value       = github_repository.repo.html_url
}

output "repo_name" {
  value = github_repository.repo.name
}
