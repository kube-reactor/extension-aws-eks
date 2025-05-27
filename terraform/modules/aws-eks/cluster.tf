locals {
  system_nodes = {
    system = {
      name = "system"

      instance_types = [var.system_node_instance_type]

      min_size     = var.min_system_nodes
      max_size     = var.max_system_nodes
      desired_size = var.min_system_nodes
      labels = {
        "node-role" = "system"
      }
    }
  }
  ops_nodes = {
    include = {
      ops = {
        name = "ops"

        instance_types = [var.ops_node_instance_type]

        min_size     = var.min_ops_nodes
        max_size     = var.max_ops_nodes
        desired_size = var.min_ops_nodes
        labels = {
          "node-role" = "ops"
        }
      }
    }
    empty = {}
  }
  app_nodes = {
    include = {
      app = {
        name = "app"

        instance_types = [var.app_node_instance_type]

        min_size     = var.min_app_nodes
        max_size     = var.max_app_nodes
        desired_size = var.min_app_nodes
        labels = {
          "node-role" = "app"
        }
      }
    }
    empty = {}
  }
}


module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.36.0"

  cluster_name    = var.name
  cluster_version = var.kube_version

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

  eks_managed_node_groups = merge(
    local.system_nodes,
    local.ops_nodes[var.min_ops_nodes > 0 ? "include" : "empty"],
    local.app_nodes[var.min_app_nodes > 0 ? "include" : "empty"]
  )
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
