<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.84.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.84.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ecr_repository.apps](https://registry.terraform.io/providers/hashicorp/aws/5.84.0/docs/resources/ecr_repository) | resource |
| [aws_ecr_repository_policy.push_access](https://registry.terraform.io/providers/hashicorp/aws/5.84.0/docs/resources/ecr_repository_policy) | resource |
| [aws_ecr_repository_policy.readonly_access](https://registry.terraform.io/providers/hashicorp/aws/5.84.0/docs/resources/ecr_repository_policy) | resource |
| [aws_iam_policy_document.push_access](https://registry.terraform.io/providers/hashicorp/aws/5.84.0/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.readonly_access](https://registry.terraform.io/providers/hashicorp/aws/5.84.0/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_force_delete"></a> [force\_delete](#input\_force\_delete) | If true, will delete the repository even if it contains images. Defaults to false. | `bool` | `false` | no |
| <a name="input_image_tag_mutability"></a> [image\_tag\_mutability](#input\_image\_tag\_mutability) | The tag mutability setting for the repository. Must be one of: MUTABLE or IMMUTABLE. Defaults to MUTABLE. | `string` | `"MUTABLE"` | no |
| <a name="input_repositories"></a> [repositories](#input\_repositories) | n/a | <pre>map(object({<br/>    tags        = map(string)<br/>    ro_accounts = list(string)<br/>    rw_accounts = list(string)<br/>  }))</pre> | `{}` | no |
| <a name="input_scan_images_on_push"></a> [scan\_images\_on\_push](#input\_scan\_images\_on\_push) | Indicates whether images are scanned after being pushed to the repository (true) or not scanned (false). | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_repository_urls"></a> [repository\_urls](#output\_repository\_urls) | The URL of the repositories (in the form aws\_account\_id.dkr.ecr.region.amazonaws.com/repositoryName). |
<!-- END_TF_DOCS -->