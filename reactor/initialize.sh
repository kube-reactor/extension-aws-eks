#
#=========================================================================================
# Initialization
#
#
# Project Directories
#
export __aws_eks_extension_dir="${2}"
export __aws_eks_terraform_dir="${__aws_eks_extension_dir}/terraform"

export __aws_state_project_dir="${__aws_eks_terraform_dir}/state"
export __aws_infrastructure_project_dir="${__aws_eks_terraform_dir}/infrastructure"
export __aws_cluster_project_dir="${__aws_eks_terraform_dir}/kubernetes-cluster"
export __aws_applications_project_dir="${__aws_eks_terraform_dir}/applications"
#
# Kubernetes Provider
#
export KUBERNETES_PROVIDER=aws_eks
#
# State
#
export TF_VAR_terraform_user="$AWS_TERRAFORM_USER"
#
# Networking
#
export TF_VAR_vpc_name="$APP_NAME"

export TF_VAR_vpc_cidr="$AWS_VPC_CIDR"
export TF_VAR_private_subnet_cidrs="$AWS_VPC_PRIVATE_SUBNET_CIDRS"
export TF_VAR_public_subnet_cidrs="$AWS_VPC_PUBLIC_SUBNET_CIDRS"
#
# Container Registry
#
export TF_VAR_repository_name="$APP_NAME"
export TF_VAR_principals_readonly_access="$AWS_ECR_PRINCIPLES_READONLY_ACCESS"
export TF_VAR_principals_push_access="$AWS_ECR_PRINCIPLES_PUSH_ACCESS"
#
# Kubernetes Cluster
#
export TF_VAR_eks_name="$APP_NAME"

export TF_VAR_eks_system_node_instance_type="$AWS_SYSTEM_NODE_TYPE"
export TF_VAR_eks_min_system_nodes="$AWS_SYSTEM_NODE_MIN_COUNT"
export TF_VAR_eks_max_system_nodes="$AWS_SYSTEM_NODE_MAX_COUNT"

export TF_VAR_eks_ops_node_instance_type="$AWS_OPS_NODE_TYPE"
export TF_VAR_eks_min_ops_nodes="$AWS_OPS_NODE_MIN_COUNT"
export TF_VAR_eks_max_ops_nodes="$AWS_OPS_NODE_MAX_COUNT"

export TF_VAR_eks_app_node_instance_type="$AWS_APP_NODE_TYPE"
export TF_VAR_eks_min_app_nodes="$AWS_APP_NODE_MIN_COUNT"
export TF_VAR_eks_max_app_nodes="$AWS_APP_NODE_MAX_COUNT"

export TF_VAR_eks_node_port="$GATEWAY_NODE_PORT"
#
# Load Balancer
#
export TF_VAR_alb_name="$APP_NAME"
export TF_VAR_domain="$PRIMARY_DOMAIN"
export TF_VAR_access_logs_bucket_name="$APP_NAME"
