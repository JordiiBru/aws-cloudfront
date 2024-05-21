resource "aws_cloudfront_origin_access_control" "access_control" {
  name                              = var.regional_domain
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

resource "aws_cloudfront_distribution" "main_distribution" {
  enabled             = true
  default_root_object = "index.html"

  origin {
    domain_name              = var.regional_domain
    origin_access_control_id = aws_cloudfront_origin_access_control.access_control.id
    origin_id                = var.bucket_origin_id
  }

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = var.bucket_origin_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  price_class = "PriceClass_100"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  tags = {
    terraform = true
    stage     = var.stage
    owner     = var.owner
  }
}