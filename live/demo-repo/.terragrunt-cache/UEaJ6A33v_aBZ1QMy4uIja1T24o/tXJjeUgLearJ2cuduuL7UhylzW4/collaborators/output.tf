output "collaborators_added" {
  value = [for c in var.collaborators : c.username]
}
