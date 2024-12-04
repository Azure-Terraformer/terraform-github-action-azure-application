locals {
  original_yaml    = file("${path.module}/files/.github/workflows/atat-pull-request-terraform-plan.yaml")
  escaped_yaml     = replace(local.original_yaml, "$${", "$$${")
  tf_template_yaml = replace(local.escaped_yaml, "$TFTPL", "$")
}

resource "github_repository_file" "pull_request_plan" {

  for_each = var.environments

  repository          = var.repository
  branch              = var.branch
  file                = ".github/workflows/atat-pull-request-terraform-plan-${each.key}.yaml"
  commit_message      = "Managed by Terraform"
  commit_author       = var.commit_user.name
  commit_email        = var.commit_user.email
  overwrite_on_create = true

  content = templatestring(local.tf_template_yaml,
    {
      environment_name = each.key
    }
  )

}
