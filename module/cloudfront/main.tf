resource "aws_cloudfront_distribution" "rivemation_cf" {
  origin {
    domain_name = "${var.S3_BUCKET_NAME}.s3.amazonaws.com"  # e.g., "my-bucket.s3.amazonaws.com"
    origin_id   = "S3Origin"

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.default.cloudfront_access_identity_path
    }
  }

  enabled             = true
  default_root_object = "index.html"

  default_cache_behavior {
    target_origin_id       = "S3Origin"
    viewer_protocol_policy = "redirect-to-https"

    allowed_methods = ["GET", "HEAD"]
    cached_methods  = ["GET", "HEAD"]

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  tags = {
    Environment = "dev"
  }
}

resource "aws_cloudfront_origin_access_identity" "default" {
  comment = "OAI for S3 access"
}
