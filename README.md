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
| [github_repository_file.pull_request_plan](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_file) | resource |
| [github_repository_file.push_apply](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_file) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_branch"></a> [branch](#input\_branch) | The branch of the GitHub repository where the workflow YAML file will be committed. | `string` | n/a | yes |
| <a name="input_commit_user"></a> [commit\_user](#input\_commit\_user) | The GitHub identity used to commit the workflow YAML file to the repository.<br><br>This includes:<br>- **name**: The name of the user committing the workflow file.<br>- **email**: The email address of the user committing the workflow file.<br><br>Ensure that the provided Git identity has the necessary permissions to push changes to the specified repository and branch. | <pre>object({<br>    name  = string<br>    email = string<br>  })</pre> | n/a | yes |
| <a name="input_environments"></a> [environments](#input\_environments) | Configuration for each of the environments for this application.<br><br>Each entry in the map represents an environment and its associated Git branch:<br>- **Key**: The name of the environment (e.g., "dev", "test", "prod").<br>- **Value**: The name of the Git branch corresponding to the environment (e.g., "develop", "release", "main").<br><br>This mapping allows the module to manage environment-specific configurations and deployments by linking each environment to its designated Git branch. It ensures that deployments are consistent and correctly targeted based on the branch associated with each environment.<br><br>**Example:**<pre>hcl<br>environments = {<br>  dev  = "develop"<br>  test = "release"<br>  prod = "main"<br>}</pre> | `map(string)` | n/a | yes |
| <a name="input_repository"></a> [repository](#input\_repository) | The name of the GitHub repository where the GitHub Actions workflow YAML file will be created. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->