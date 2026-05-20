data "aws_iam_policy_document" "ec2_assume_role" {
  statement {
    sid    = "AllowEC2AssumeRole"
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "nextcrm_ec2_role" {
  name = "${var.project_name}-${var.environment}-nextcrm-ec2-role"

  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role.json

  tags = {
    Name        = "${var.project_name}-${var.environment}-nextcrm-ec2-role"
    Project     = var.project_name
    Environment = var.environment
    Role        = "nextcrm-source-ec2"
    ManagedBy   = "terraform"
  }
}

data "aws_iam_policy_document" "nextcrm_s3_access" {
  statement {
    sid    = "AllowListNextCRMBucket"
    effect = "Allow"

    actions = [
      "s3:ListBucket"
    ]

    resources = [
      var.s3_bucket_arn
    ]
  }

  statement {
    sid    = "AllowNextCRMObjectAccess"
    effect = "Allow"

    actions = [
      "s3:GetObject",
      "s3:PutObject",
      "s3:DeleteObject"
    ]

    resources = [
      "${var.s3_bucket_arn}/*"
    ]
  }
}

resource "aws_iam_policy" "nextcrm_s3_access" {
  name        = "${var.project_name}-${var.environment}-nextcrm-s3-access"
  description = "Least-privilege S3 access policy for the NextCRM EC2 instance."
  policy      = data.aws_iam_policy_document.nextcrm_s3_access.json

  tags = {
    Name        = "${var.project_name}-${var.environment}-nextcrm-s3-access"
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_role_policy_attachment" "nextcrm_s3_access" {
  role       = aws_iam_role.nextcrm_ec2_role.name
  policy_arn = aws_iam_policy.nextcrm_s3_access.arn
}

resource "aws_iam_instance_profile" "nextcrm_ec2_profile" {
  name = "${var.project_name}-${var.environment}-nextcrm-ec2-profile"
  role = aws_iam_role.nextcrm_ec2_role.name

  tags = {
    Name        = "${var.project_name}-${var.environment}-nextcrm-ec2-profile"
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}