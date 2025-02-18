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

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.84.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_eks"></a> [eks](#module\_eks) | terraform-aws-modules/eks/aws | 20.33.1 |
| <a name="module_irsa-ebs-csi"></a> [irsa-ebs-csi](#module\_irsa-ebs-csi) | terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc | 5.52.2 |

## Resources

| Name | Type |
|------|------|
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |
| [aws_iam_policy.ebs_csi_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |
| [aws_subnets.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_vpc.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_node_instance_type"></a> [app\_node\_instance\_type](#input\_app\_node\_instance\_type) | Kubernetes app node AWS instance type | `string` | `"t3.medium"` | no |
| <a name="input_max_app_nodes"></a> [max\_app\_nodes](#input\_max\_app\_nodes) | Maximum number of Kubernetes app nodes | `number` | `1` | no |
| <a name="input_max_ops_nodes"></a> [max\_ops\_nodes](#input\_max\_ops\_nodes) | Maximum number of Kubernetes ops nodes | `number` | `1` | no |
| <a name="input_max_system_nodes"></a> [max\_system\_nodes](#input\_max\_system\_nodes) | Maximum number of Kubernetes system nodes | `number` | `1` | no |
| <a name="input_min_app_nodes"></a> [min\_app\_nodes](#input\_min\_app\_nodes) | Minimum number of Kubernetes app nodes | `number` | `1` | no |
| <a name="input_min_ops_nodes"></a> [min\_ops\_nodes](#input\_min\_ops\_nodes) | Minimum number of Kubernetes ops nodes | `number` | `1` | no |
| <a name="input_min_system_nodes"></a> [min\_system\_nodes](#input\_min\_system\_nodes) | Minimum number of Kubernetes system nodes | `number` | `1` | no |
| <a name="input_name"></a> [name](#input\_name) | AWS EKS Cluster Name | `string` | n/a | yes |
| <a name="input_ops_node_instance_type"></a> [ops\_node\_instance\_type](#input\_ops\_node\_instance\_type) | Kubernetes ops node AWS instance type | `string` | `"t3.medium"` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region | `string` | `"us-east-1"` | no |
| <a name="input_system_node_instance_type"></a> [system\_node\_instance\_type](#input\_system\_node\_instance\_type) | Kubernetes system node AWS instance type | `string` | `"t3.medium"` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | AWS VPC CIDR | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_endpoint"></a> [cluster\_endpoint](#output\_cluster\_endpoint) | Endpoint for EKS control plane |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | Kubernetes Cluster Name |
| <a name="output_cluster_security_group_id"></a> [cluster\_security\_group\_id](#output\_cluster\_security\_group\_id) | Security group ids attached to the cluster control plane |
| <a name="output_region"></a> [region](#output\_region) | AWS region |
<!-- END_TF_DOCS -->