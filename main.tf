
locals {
  files = [
    ".github/workflows/atat-manual-trigger-terraform-plan.yaml",
    ".github/workflows/atat-manual-trigger-terraform-apply.yaml",
    ".github/workflows/atat-manual-trigger-terraform-destroy.yaml"
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

locals {
  original_yaml    = file("${path.module}/files/.github/workflows/atat-pull-request-terraform-plan.yaml")
  escaped_yaml     = replace(original_yaml, "$${", "$$$${")
  tf_template_yaml = replace(escaped_yaml, "$TFTPL", "$")
}

resource "github_repository_file" "pull_request_plan" {

  count = length(var.environments)

  repository          = var.repository
  branch              = var.branch
  file                = ".github/workflows/atat-pull-request-plan-terraform-plan-${var.environments[count.index]}.yaml"
  commit_message      = "Managed by Terraform"
  commit_author       = var.commit_user.name
  commit_email        = var.commit_user.email
  overwrite_on_create = true

  content = templatestring(tf_template_yaml,
    {
      environment_name = "${var.environments[count.index]}"
    }
  )

}
