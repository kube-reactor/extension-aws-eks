module "aws-eks" {
  source = "../modules/aws-eks"

  region   = var.region
  vpc_cidr = var.vpc_cidr

  name         = var.eks_name
  kube_version = var.eks_version

  system_node_instance_type = var.eks_system_node_instance_type
  min_system_nodes          = var.eks_min_system_nodes
  max_system_nodes          = var.eks_max_system_nodes

  data_node_instance_type     = var.eks_data_node_instance_type
  min_data_nodes              = var.eks_min_data_nodes
  max_data_nodes              = var.eks_max_data_nodes
  data_node_volume_mount_path = var.eks_data_node_volume_mount_path
  data_node_volume_type       = var.eks_data_node_volume_type
  data_node_volume_size       = var.eks_data_node_volume_size
  data_node_volume_iops       = var.eks_data_node_volume_iops
  data_node_volume_throughput = var.eks_data_node_volume_throughput
  data_node_volume_encrypted  = var.eks_data_node_volume_encrypted

  ops_node_instance_type = var.eks_ops_node_instance_type
  min_ops_nodes          = var.eks_min_ops_nodes
  max_ops_nodes          = var.eks_max_ops_nodes

  app_node_instance_type = var.eks_app_node_instance_type
  min_app_nodes          = var.eks_min_app_nodes
  max_app_nodes          = var.eks_max_app_nodes
}
