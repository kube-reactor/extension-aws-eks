<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.3 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_argocd-apps"></a> [argocd-apps](#module\_argocd-apps) | ../../../../terraform/argocd-apps/gateway | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_argocd_admin_password"></a> [argocd\_admin\_password](#input\_argocd\_admin\_password) | ArgoCD administrator password (bcrypt hash) | `string` | n/a | yes |
| <a name="input_argocd_project_sequence"></a> [argocd\_project\_sequence](#input\_argocd\_project\_sequence) | ArgoCD provisioner project sequence | `list(string)` | <pre>[<br/>  "system",<br/>  "platform",<br/>  "database",<br/>  "management"<br/>]</pre> | no |
| <a name="input_domain"></a> [domain](#input\_domain) | Platform domain | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Platform environment | `string` | `"local"` | no |
| <a name="input_kube_config"></a> [kube\_config](#input\_kube\_config) | Kubernetes cluster credential file | `string` | n/a | yes |
| <a name="input_project_path"></a> [project\_path](#input\_project\_path) | Base project path | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | AWS region | `string` | `"us-east-1"` | no |
| <a name="input_variables"></a> [variables](#input\_variables) | Map of environment variables for interpolation into application configurations | `map(string)` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->