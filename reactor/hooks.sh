
function hook_clean_terraform () {
  rm -f "${__aws_infrastructure_project_dir}/.terraform.lock.hcl"
  rm -f "${__aws_cluster_project_dir}/.terraform.lock.hcl"
  rm -f "${__aws_applications_project_dir}/.terraform.lock.hcl"
}