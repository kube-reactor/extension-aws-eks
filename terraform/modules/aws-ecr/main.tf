
data "aws_iam_policy_document" "readonly_access" {
  for_each = {
    for key, value in var.repositories : key => value
    if length(value.ro_accounts) > 0
  }

  statement {
    sid    = "ECRReadonlyAccess"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = each.value.ro_accounts
    }

    actions = [
      "ecr:BatchCheckLayerAvailability",
      "ecr:BatchGetImage",
      "ecr:DescribeImageScanFindings",
      "ecr:DescribeImages",
      "ecr:DescribeRepositories",
      "ecr:GetDownloadUrlForLayer",
      "ecr:GetLifecyclePolicy",
      "ecr:GetLifecyclePolicyPreview",
      "ecr:GetRepositoryPolicy",
      "ecr:ListImages",
      "ecr:ListTagsForResource",
    ]
  }
}

data "aws_iam_policy_document" "push_access" {
  for_each = {
    for key, value in var.repositories : key => value
    if length(value.rw_accounts) > 0
  }

  statement {
    sid    = "ECRPushAccess"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = each.value.rw_accounts
    }

    actions = [
      "ecr:CompleteLayerUpload",
      "ecr:GetAuthorizationToken",
      "ecr:UploadLayerPart",
      "ecr:InitiateLayerUpload",
      "ecr:BatchCheckLayerAvailability",
      "ecr:PutImage",
    ]
  }
}

resource "aws_ecr_repository" "apps" {
  for_each = var.repositories

  name                 = each.key
  image_tag_mutability = var.image_tag_mutability
  force_delete         = var.force_delete

  image_scanning_configuration {
    scan_on_push = var.scan_images_on_push
  }

  tags = each.value.tags
}

resource "aws_ecr_repository_policy" "readonly_access" {
  for_each   = data.aws_iam_policy_document.readonly_access
  repository = each.key
  policy     = each.value.json
}

resource "aws_ecr_repository_policy" "push_access" {
  for_each   = data.aws_iam_policy_document.push_access
  repository = each.key
  policy     = each.value.json
}
