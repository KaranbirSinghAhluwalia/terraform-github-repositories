variable "app_id" {
  description = "GitHub App ID"
  type = string
  default = ""
}

variable "app_installation_id" {
  description = "GitHub App Installation ID"
  type = string
  default = ""
}

variable "app_pem_path" {
  description = "Path to the GitHub App PEM file"
  type = string
  default = ""
}

variable "repo_name" {
  description = "GitHub repository name"
  type        = string
}

variable "repo_description" {
  description = "GitHub repository description"
  type        = string
  default     = ""
}

variable "repo_visibility" {
  description = "GitHub repository visibility"
  type        = string
  default     = "private"
}

variable "repo_topics" {
  description = "GitHub repository topics"
  type        = list(string)
  default     = []
}

variable "project_type" {
  description = "Type of the project to determine which CI workflow to create"
  type        = string
  default     = "terraform"
}

variable "branch_protections" {
  type = list(object({
    pattern                      = string
    enforce_admins               = bool
    required_pull_request_reviews = object({
      required_approving_review_count = number
    })
    allow_force_pushes = bool
    allow_deletions    = bool
  }))
  default = []
}

variable "collaborators" {
  type = list(object({
    username   = string
    permission = string
  }))
  default = []
}

variable "secrets" {
  type    = map(string)
  default = {}
} 
