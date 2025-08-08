output "protected_branches" {
  value = [for b in var.branch_protections : b.pattern]
}
