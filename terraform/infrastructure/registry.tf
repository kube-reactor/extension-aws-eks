
module "ecr" {
  source = "../modules/aws-ecr"

  repositories         = try(var.repositories, {})
  force_delete         = var.force_delete
  image_tag_mutability = var.image_tag_mutability
  scan_images_on_push  = var.scan_images_on_push
}
