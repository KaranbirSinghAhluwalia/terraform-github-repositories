variable "github_token" {
  type        = string
  sensitive   = true
}

variable "github_owner" {
  type = string
}

variable "repo_name" {
  type = string
}

variable "secrets" {
  type        = map(string)
  default     = {}
  description = "Map of GitHub Actions secrets to add"
}
