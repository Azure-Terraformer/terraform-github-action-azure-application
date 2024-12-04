locals {
  merge_original_yaml    = file("${path.module}/files/.github/workflows/atat-merge-terraform-apply.yaml")
  merge_escaped_yaml     = replace(local.merge_original_yaml, "$${", "$$${")
  merge_tf_template_yaml = replace(local.merge_escaped_yaml, "$TFTPL", "$")
}

resource "github_repository_file" "push_apply" {

  for_each = var.environments

  repository          = var.repository
  branch              = var.branch
  file                = ".github/workflows/atat-push-terraform-apply-${each.key}.yaml"
  commit_message      = "Managed by Terraform"
  commit_author       = var.commit_user.name
  commit_email        = var.commit_user.email
  overwrite_on_create = true

  content = templatestring(local.merge_tf_template_yaml,
    {
      environment_name = each.key
      branch_name      = each.value
    }
  )

}
