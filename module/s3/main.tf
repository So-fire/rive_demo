resource "aws_s3_bucket" "rivemation_frontend" {
  bucket = var.bucket_name

  tags = {
    Name = "rivemation-${var.environment}-bucket"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.rivemation_frontend.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "rivemation-public_access" {
  bucket                  = aws_s3_bucket.rivemation_frontend.id
  block_public_acls       = false
  block_public_policy     = false # Disable blocking public policies
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# resource "aws_s3_bucket_policy" "bucket_policy" {
#   bucket = aws_s3_bucket.naughtrapper.id
#   policy = jsonencode({
#     "Version" : "2012-10-17",
#     "Statement" : [
#       {
#         "Sid" : "AllowReadOnlyAccess",
#         "Effect" : "Allow",
#         "Principal" : "*",
#         "Action" : "s3:*",
#         "Resource" : "arn:aws:s3:::${var.bucket_name}/*"
#       }
#     ]
#   })
# }
