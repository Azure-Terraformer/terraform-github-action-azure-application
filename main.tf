
locals {
  files = [
    ".github/workflows/atat-manual-trigger-terraform-plan.yaml",
    ".github/workflows/atat-manual-trigger-terraform-plan2.yaml",
    ".github/workflows/atat-manual-trigger-terraform-apply.yaml",
    ".github/workflows/atat-manual-trigger-terraform-destroy.yaml",
    ".github/workflows/atat-pull-request.yaml",
    ".github/workflows/atat-terraform-core-workflow-plan.yaml"
  ]
}

resource "github_repository_file" "bulk" {

  count = length(local.files)

  repository          = var.repository
  branch              = var.branch
  file                = local.files[count.index]
  content             = file("${path.module}/files/${local.files[count.index]}")
  commit_message      = "Managed by Terraform"
  commit_author       = var.commit_user.name
  commit_email        = var.commit_user.email
  overwrite_on_create = true

}
