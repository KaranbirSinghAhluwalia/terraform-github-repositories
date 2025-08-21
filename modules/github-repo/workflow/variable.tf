variable "repo_name" {
  type        = string
  description = "Repository name"
}

variable "project_type" {
  description = "Type of the project to determine which CI workflow to create"
  type        = string
  default     = "terraform"
}

variable "workflows" {
  description = "Map of project types to workflow content"
  type        = map(string)
  default = {
    terraform = <<EOT
name: Terraform CI

on:
  push:
    branches: [ "main" ]
  pull_request:
    branches: [ "main" ]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Set up Terraform
        uses: hashicorp/setup-terraform@v2
      - name: Terraform Format
        run: terraform fmt -check
      - name: Terraform Init
        run: terraform init
      - name: Terraform Validate
        run: terraform validate
EOT

    nodejs = <<EOT
name: Node.js CI

on:
  push:
    branches: [ "main" ]
  pull_request:
    branches: [ "main" ]

jobs:
  build:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        node-version: [14,16]
    steps:
      - uses: actions/checkout@v3
      - name: Use Node.js
        uses: actions/setup-node@v3
        with:
          node-version: 16
      - run: npm install
      - run: npm test
EOT
  }
}