# variables.tf
variable "name" {}

# main.tf
locals {
  formatted_greeting = "Hejsan, ${var.name}"
}

# outputs.tf
output "greeting" {
  value = "${local.formatted_greeting}"
}
