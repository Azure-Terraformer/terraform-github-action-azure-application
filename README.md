# Overview

This Terraform module automates the provisioning of essential GitHub Actions workflow YAML files within a specified repository and branch, facilitating streamlined Terraform operations across multiple environments. It deploys a set of standardized workflows for manual Terraform planning, applying, destroying, and lease management, ensuring consistent infrastructure management practices. 

Additionally, the module dynamically generates environment-specific pull request and push workflows by leveraging input configurations, allowing tailored deployments based on different environments and their corresponding Git branches. 

By managing these workflow files through Terraform, the module ensures that GitHub Actions are consistently configured, easily maintainable, and seamlessly integrated into the GitHub AT-AT framework for efficient automation of Terraform and Azure-based projects.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_github"></a> [github](#requirement\_github) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | ~> 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [github_repository_file.bulk](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_file) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_branch"></a> [branch](#input\_branch) | n/a | `string` | n/a | yes |
| <a name="input_commit_user"></a> [commit\_user](#input\_commit\_user) | n/a | <pre>object({<br>    name  = string<br>    email = string<br>  })</pre> | n/a | yes |
| <a name="input_repository"></a> [repository](#input\_repository) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->