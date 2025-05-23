
function kubernetes_status_aws_eks () {
  if [[ "${AWS_ACCESS_KEY_ID:-}" ]] && [[ "${AWS_SECRET_ACCESS_KEY:-}" ]]; then
    if aws eks describe-cluster --name "$APP_NAME" --region "$AWS_EKS_REGION" 1>/dev/null 2>&1; then
      return 0
    fi
  fi
  return 1
}

function add_container_environment_aws_eks () {
  if kubernetes_status_aws_eks; then
    if [ ! "${REACTOR_SHELL_OUTPUT:-}" ]; then
      aws eks update-kubeconfig \
        --region "$AWS_EKS_REGION" \
        --name "$APP_NAME" \
        --kubeconfig "$KUBECONFIG" 1>>"$(logfile)" 2>&1
    else
        aws eks update-kubeconfig \
        --region "$AWS_EKS_REGION" \
        --name "$APP_NAME" \
        --kubeconfig "$KUBECONFIG" 1>/dev/null 2>&1
    fi
  fi

  if [[ ! "${AWS_ACCOUNT_ID:-}" ]] && [[ "${AWS_ACCESS_KEY_ID:-}" ]] && [[ "${AWS_SECRET_ACCESS_KEY:-}" ]]; then
    export AWS_ACCOUNT_ID="$(aws sts get-caller-identity --query Account --output text)"
  fi
  export AWS_ECR_REGISTRY_DOMAIN="${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_EKS_REGION}.amazonaws.com"
}


function start_kubernetes_aws_eks () {
  provisioner_create infrastructure "${__aws_infrastructure_project_dir}"
  provisioner_create cluster "${__aws_cluster_project_dir}"
}

function provision_kubernetes_applications_aws_eks () {
  add_container_environment_aws_eks
  provisioner_create applications "${__aws_applications_project_dir}"
}

function destroy_kubernetes_applications_aws_eks () {
  add_container_environment_aws_eks
  if [ "${PROVISIONER_FORCE_DELETE_APPLICATIONS:-}" ]; then
    provisioner_delete applications "${__aws_applications_project_dir}"
  else
    provisioner_destroy applications "${__aws_applications_project_dir}"
  fi
}

function destroy_kubernetes_aws_eks () {
  provisioner_destroy cluster "${__aws_cluster_project_dir}"
  provisioner_destroy infrastructure "${__aws_infrastructure_project_dir}"
}
