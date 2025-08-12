variable "repo_name" {
  type = string
}

variable "collaborators" {
  type = list(object({
    username   = string
    permission = string # pull, push, admin, maintain, triage
  }))
  default = []
}
