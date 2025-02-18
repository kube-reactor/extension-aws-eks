<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.84.0 |
| <a name="requirement_cloudinit"></a> [cloudinit](#requirement\_cloudinit) | ~> 2.3.4 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.6.1 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | ~> 4.0.5 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aws-eks"></a> [aws-eks](#module\_aws-eks) | ../modules/aws-eks | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain"></a> [domain](#input\_domain) | Project domain | `string` | n/a | yes |
| <a name="input_eks_app_node_instance_type"></a> [eks\_app\_node\_instance\_type](#input\_eks\_app\_node\_instance\_type) | Kubernetes app node AWS instance type | `string` | `"t3.medium"` | no |
| <a name="input_eks_max_app_nodes"></a> [eks\_max\_app\_nodes](#input\_eks\_max\_app\_nodes) | Maximum number of Kubernetes app nodes | `number` | `1` | no |
| <a name="input_eks_max_ops_nodes"></a> [eks\_max\_ops\_nodes](#input\_eks\_max\_ops\_nodes) | Maximum number of Kubernetes ops nodes | `number` | `1` | no |
| <a name="input_eks_max_system_nodes"></a> [eks\_max\_system\_nodes](#input\_eks\_max\_system\_nodes) | Maximum number of Kubernetes system nodes | `number` | `1` | no |
| <a name="input_eks_min_app_nodes"></a> [eks\_min\_app\_nodes](#input\_eks\_min\_app\_nodes) | Minimum number of Kubernetes app nodes | `number` | `1` | no |
| <a name="input_eks_min_ops_nodes"></a> [eks\_min\_ops\_nodes](#input\_eks\_min\_ops\_nodes) | Minimum number of Kubernetes ops nodes | `number` | `1` | no |
| <a name="input_eks_min_system_nodes"></a> [eks\_min\_system\_nodes](#input\_eks\_min\_system\_nodes) | Minimum number of Kubernetes system nodes | `number` | `1` | no |
| <a name="input_eks_name"></a> [eks\_name](#input\_eks\_name) | AWS EKS Cluster Name | `string` | n/a | yes |
| <a name="input_eks_ops_node_instance_type"></a> [eks\_ops\_node\_instance\_type](#input\_eks\_ops\_node\_instance\_type) | Kubernetes ops node AWS instance type | `string` | `"t3.medium"` | no |
| <a name="input_eks_system_node_instance_type"></a> [eks\_system\_node\_instance\_type](#input\_eks\_system\_node\_instance\_type) | Kubernetes system node AWS instance type | `string` | `"t3.medium"` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region | `string` | `"us-east-1"` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | AWS VPC CIDR | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->