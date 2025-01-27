
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.33.1"

  cluster_name    = var.name
  cluster_version = "1.31"

  cluster_endpoint_public_access           = true
  enable_cluster_creator_admin_permissions = true

  cluster_addons = {
    aws-ebs-csi-driver = {
      service_account_role_arn = module.irsa-ebs-csi.iam_role_arn
    }
  }

  vpc_id     = data.aws_vpc.cluster.id
  subnet_ids = data.aws_subnets.private.ids

  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64"
  }

  eks_managed_node_groups = {
    system = {
      name = "system"

      instance_types = [var.system_node_instance_type]

      min_size     = var.min_system_nodes
      max_size     = var.max_system_nodes
      desired_size = var.min_system_nodes
    },
    ops = {
      name = "ops"

      instance_types = [var.ops_node_instance_type]

      min_size     = var.min_ops_nodes
      max_size     = var.max_ops_nodes
      desired_size = var.min_ops_nodes
    },
    app = {
      name = "app"

      instance_types = [var.app_node_instance_type]

      min_size     = var.min_app_nodes
      max_size     = var.max_app_nodes
      desired_size = var.min_app_nodes
    }
  }
}

module "irsa-ebs-csi" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
  version = "5.52.2"

  create_role                   = true
  role_name                     = "AmazonEKSTFEBSCSIRole-${module.eks.cluster_name}"
  provider_url                  = module.eks.oidc_provider
  role_policy_arns              = [data.aws_iam_policy.ebs_csi_policy.arn]
  oidc_fully_qualified_subjects = ["system:serviceaccount:kube-system:ebs-csi-controller-sa"]
}
