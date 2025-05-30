
locals {
  disk_attachments = {
    sdx = {
      device_name = "/dev/sdx"
      ebs = {
        volume_size           = var.data_node_volume_size
        volume_type           = var.data_node_volume_type
        iops                  = var.data_node_volume_iops
        throughput            = var.data_node_volume_throughput
        encrypted             = var.data_node_volume_encrypted
        delete_on_termination = true
      }
    }
  }

  storage_instance_user_data = <<-EOT
yum -y install iscsi-initiator-utils xfsprogs

MOUNT_POINT=$(lsblk -o MOUNTPOINT -nr /dev/sdx)
if [[ -z "$MOUNT_POINT" ]]
then
  MOUNT_POINT=${var.data_node_volume_mount_path}
  FILE_SYSTEM=$(lsblk -o FSTYPE -nr /dev/sdx)

  if [[ $FILE_SYSTEM != 'xfs' ]]
  then
      mkfs -t xfs /dev/sdx
  fi

  mkdir -p $MOUNT_POINT
  mount /dev/sdx $MOUNT_POINT

  cp /etc/fstab /etc/fstab.orig
  VOLUME_ID=$(lsblk -o UUID -nr /dev/sdx)

  if [[ ! -z $VOLUME_ID ]]
  then
    tee -a /etc/fstab <<EOF
UUID=$VOLUME_ID  $MOUNT_POINT  xfs  defaults,nofail  0  2
EOF
  fi
fi
EOT

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
  data_nodes = {
    data = {
      name = "data"

      instance_types = [var.data_node_instance_type]

      min_size     = var.min_data_nodes
      max_size     = var.max_data_nodes
      desired_size = var.min_data_nodes

      ebs_optimized           = true
      block_device_mappings   = local.disk_attachments
      pre_bootstrap_user_data = local.storage_instance_user_data

      labels = {
        "node-role"                            = "data"
        "node.longhorn.io/create-default-disk" = "true"
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
