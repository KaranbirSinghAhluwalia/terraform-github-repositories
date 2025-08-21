variable "repo_name" {
  type        = string
  description = "GitHub repository name"
}

variable "branch_name" {
  type        = string
  description = "Branch to create"
}

variable "source_branch" {
  type        = string
  description = "Branch to create from"
  default     = "main"
}
