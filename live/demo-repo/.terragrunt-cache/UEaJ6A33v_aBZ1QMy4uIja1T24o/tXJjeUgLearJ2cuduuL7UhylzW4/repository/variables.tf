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
  description = "Repository visibility: public or private"
  type        = string
  default     = "private"
}

variable "repo_topics" {
  description = "Repository topics"
  type        = list(string)
  default     = []
}