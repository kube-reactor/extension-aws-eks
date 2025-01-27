#
#=========================================================================================
# Initialization
#
export __aws_eks_extension_dir="${2}"
export __aws_eks_terraform_dir="${__aws_eks_extension_dir}/terraform"

export __aws_state_project_dir="${__aws_eks_terraform_dir}/state"
export __aws_infrastructure_project_dir="${__aws_eks_terraform_dir}/infrastructure"
export __aws_cluster_project_dir="${__aws_eks_terraform_dir}/kubernetes-cluster"
export __aws_applications_project_dir="${__aws_eks_terraform_dir}/applications"
