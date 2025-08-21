variable "repo_name" {
  type        = string
  description = "Repository name"
}

variable "branch_name" {
  type = string
}


variable "branch_depends_on" {
  type = any
  default = null
}