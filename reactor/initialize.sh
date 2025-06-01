#
#=========================================================================================
# Initialization
#
#
# Project Directories
#
export __aws_eks_extension_dir="${2}"
export __aws_eks_terraform_dir="${__aws_eks_extension_dir}/terraform"

export __aws_infrastructure_project_dir="${__aws_eks_terraform_dir}/infrastructure"
export __aws_cluster_project_dir="${__aws_eks_terraform_dir}/kubernetes-cluster"
export __aws_applications_project_dir="${__aws_eks_terraform_dir}/applications"

if [ "${KUBERNETES_PROVIDER:-}" == "aws_eks" ]; then
  export AWS_EKS_REGION="${AWS_EKS_REGION:-"us-east-1"}"
  #
  # Networking
  #
  export TF_VAR_region="$AWS_EKS_REGION"
  export TF_VAR_vpc_name="$APP_NAME"

  export TF_VAR_vpc_cidr="$AWS_VPC_CIDR"
  export TF_VAR_private_subnet_cidrs="$AWS_VPC_PRIVATE_SUBNET_CIDRS"
  export TF_VAR_public_subnet_cidrs="$AWS_VPC_PUBLIC_SUBNET_CIDRS"
  #
  # Container Registry
  #
  export TF_VAR_repositories="${AWS_ECR_REPOSITORIES:-"\{\}"}"
  export TF_VAR_force_delete="${AWS_ECR_FORCE_DELETE:-false}"
  export TF_VAR_image_tag_mutability="${AWS_ECR_IMAGE_TAG_MUTABILITY:-MUTABLE}"
  export TF_VAR_scan_images_on_push="${AWS_ECR_SCAN_IMAGES_ON_PUSH:-false}"
  #
  # Kubernetes Cluster
  #
  export TF_VAR_eks_name="$APP_NAME"
  export TF_VAR_eks_version="${AWS_EKS_VERSION:-"1.32"}"

  export TF_VAR_eks_node_volume_mount_path="${AWS_NODE_VOLUME_MOUNT_PATH:-"/var/lib/longhorn"}"

  export TF_VAR_eks_system_node_instance_type="${AWS_SYSTEM_NODE_TYPE:-"t3.xlarge"}"
  export TF_VAR_eks_min_system_nodes="${AWS_SYSTEM_NODE_MIN_COUNT:-1}"
  export TF_VAR_eks_max_system_nodes="${AWS_SYSTEM_NODE_MAX_COUNT:-1}"

  export TF_VAR_eks_data_node_instance_type="${AWS_DATA_NODE_TYPE:-"t3.xlarge"}"
  export TF_VAR_eks_data_nodes="${AWS_DATA_NODE_COUNT:-1}"
  export TF_VAR_eks_data_node_volume_type="${AWS_DATA_NODE_VOLUME_TYPE:-"gp3"}"
  export TF_VAR_eks_data_node_volume_size="${AWS_DATA_NODE_VOLUME_SIZE:-100}"
  export TF_VAR_eks_data_node_volume_iops="${AWS_DATA_NODE_VOLUME_IOPS:-3000}"
  export TF_VAR_eks_data_node_volume_throughput="${AWS_DATA_NODE_VOLUME_THROUGHPUT:-125}"
  export TF_VAR_eks_data_node_volume_encrypted="${AWS_DATA_NODE_VOLUME_ENCRYPTED:-true}"

  export TF_VAR_eks_storage_node_instance_type="${AWS_STORAGE_NODE_TYPE:-"t3.medium"}"
  export TF_VAR_eks_storage_nodes="${AWS_STORAGE_NODE_COUNT:-1}"
  export TF_VAR_eks_storage_node_volume_type="${AWS_STORAGE_NODE_VOLUME_TYPE:-"gp3"}"
  export TF_VAR_eks_storage_node_volume_size="${AWS_STORAGE_NODE_VOLUME_SIZE:-100}"
  export TF_VAR_eks_storage_node_volume_iops="${AWS_STORAGE_NODE_VOLUME_IOPS:-3000}"
  export TF_VAR_eks_storage_node_volume_throughput="${AWS_STORAGE_NODE_VOLUME_THROUGHPUT:-125}"
  export TF_VAR_eks_storage_node_volume_encrypted="${AWS_STORAGE_NODE_VOLUME_ENCRYPTED:-true}"

  export TF_VAR_eks_ops_node_instance_type="${AWS_OPS_NODE_TYPE:-"t3.xlarge"}"
  export TF_VAR_eks_min_ops_nodes="${AWS_OPS_NODE_MIN_COUNT:-0}"
  export TF_VAR_eks_max_ops_nodes="${AWS_OPS_NODE_MAX_COUNT:-0}"

  export TF_VAR_eks_app_node_instance_type="${AWS_APP_NODE_TYPE:-"t3.xlarge"}"
  export TF_VAR_eks_min_app_nodes="${AWS_APP_NODE_MIN_COUNT:-0}"
  export TF_VAR_eks_max_app_nodes="${AWS_APP_NODE_MAX_COUNT:-0}"
  #
  # Load Balancer
  #
  export TF_VAR_domain="$PRIMARY_DOMAIN"
fi
