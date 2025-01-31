
function aws_cluster_environment () {
  if [ "${__project_dir:-}" ]; then
    debug "Setting AWS environment ..."
    export AWS_PRIMARY_REGION="${AWS_PRIMARY_REGION:-"us-east-1"}"
    export AWS_SECONDARY_REGION="${AWS_SECONDARY_REGION:-"us-west-1"}"
    export AWS_ACCESS_KEY_ID="${AWS_ACCESS_KEY_ID:-}"
    export AWS_SECRET_ACCESS_KEY="${AWS_SECRET_ACCESS_KEY:-}"

    export AWS_STATE_BUCKET_NAME="${AWS_STATE_BUCKET_NAME:-"${APP_NAME}-${__environment}"}"
    export AWS_STATE_KMS_KEY_ID="${AWS_STATE_KMS_KEY_ID:-}"

    debug "AWS_PRIMARY_REGION: ${AWS_PRIMARY_REGION}"
    debug "AWS_SECONDARY_REGION: ${AWS_SECONDARY_REGION}"
    debug "AWS_STATE_BUCKET_NAME: ${AWS_STATE_BUCKET_NAME}"

    if [[ ! "$AWS_ACCESS_KEY_ID" ]] || [[ ! "$AWS_SECRET_ACCESS_KEY" ]]; then
      emergency "To provision AWS resources, you must specify AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY environment variables"
    fi
  fi
}


function kubernetes_status_aws_eks () {
  aws_cluster_environment

  if [ "${APP_NAME:-}" ]; then
    if aws eks describe-cluster --name "$APP_NAME" --region "$AWS_PRIMARY_REGION" 1>/dev/null 2>&1; then
      return 0
    fi
  fi
  return 1
}


function add_container_environment_aws_eks () {
  if kubernetes_status_aws_eks; then
    aws eks update-kubeconfig \
      --region "$AWS_PRIMARY_REGION" \
      --name "$APP_NAME" \
      --kubeconfig "$KUBECONFIG" 1>>"$(logfile)" 2>&1
  fi
}


function start_kubernetes_aws_eks () {
  aws_cluster_environment

  export TF_VAR_region="$AWS_PRIMARY_REGION"

  load_hook aws_variables

  if [ ! "${__aws_infrastructure_project_dir}" ]; then
    emergency "In order to provision AWS infrastructure you must specify the '__aws_infrastructure_project_dir' environment variable in the project to map to a Terraform module"
  fi
  if [ ! "${__aws_cluster_project_dir}" ]; then
    emergency "In order to provision Kubernetes cluster you must specify the '__aws_cluster_project_dir' environment variable in the project to map to a Terraform module"
  fi

  info "Managing Infrastructure ..."
  run_provisioner "${__aws_infrastructure_project_dir}" infrastructure

  info "Managing Kubernetes Cluster ..."
  run_provisioner "${__aws_cluster_project_dir}" cluster

  run_hook start_aws_eks
}

function provision_kubernetes_applications_aws_eks () {
  aws_cluster_environment

  export TF_VAR_region="$AWS_PRIMARY_REGION"

  load_hook aws_variables

  if [ ! "${__aws_applications_project_dir}" ]; then
    emergency "In order to provision Kubernetes applications you must specify the '__aws_applications_project_dir' environment variable in the project to map to a Terraform module"
  fi

  info "Saving kubeconfig file ..."
  aws eks update-kubeconfig \
    --region "$AWS_PRIMARY_REGION" \
    --name "$APP_NAME" \
    --kubeconfig "$KUBECONFIG" 1>>"$(logfile)" 2>&1

  info "Managing ArgoCD Applications ..."
  run_provisioner "${__aws_applications_project_dir}" applications

  run_hook start_aws_eks_applications
}

function destroy_kubernetes_aws_eks () {
  aws_cluster_environment

  export TF_VAR_region="$AWS_PRIMARY_REGION"

  load_hook aws_variables

  if [ ! "${__aws_infrastructure_project_dir}" ]; then
    emergency "In order to provision AWS infrastructure you must specify the '__aws_infrastructure_project_dir' environment variable in the project to map to a Terraform module"
  fi
  if [ ! "${__aws_cluster_project_dir}" ]; then
    emergency "In order to provision Kubernetes cluster you must specify the '__aws_cluster_project_dir' environment variable in the project to map to a Terraform module"
  fi

  info "Saving kubeconfig file ..."
  aws eks update-kubeconfig \
    --region "$AWS_PRIMARY_REGION" \
    --name "$APP_NAME" \
    --kubeconfig "$KUBECONFIG" 1>>"$(logfile)" 2>&1

  info "Destroying ArgoCD Applications ..."
  run_provisioner_destroy "${__aws_applications_project_dir}" applications

  info "Destroying Kubernetes Cluster ..."
  run_provisioner_destroy "${__aws_cluster_project_dir}" cluster

  info "Destroying Infrastructure ..."
  run_provisioner_destroy "${__aws_infrastructure_project_dir}" infrastructure

  run_hook destroy_aws_eks
}
