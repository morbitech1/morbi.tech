resource "aws_cloudfront_origin_access_identity" "website" {

}

resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = aws_s3_bucket.website.bucket_regional_domain_name
    origin_id   = local.s3_origin_id

  }

  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"


  aliases = [
    "morbi.tech"
  ]

  default_cache_behavior {
    allowed_methods  = [
      "DELETE",
      "GET",
      "HEAD",
      "OPTIONS",
      "PATCH",
      "POST",
      "PUT",
    ]
    cached_methods   = [
      "GET",
      "HEAD",
    ]
    target_origin_id = local.s3_origin_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "allow-all"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  price_class = "PriceClass_200"

  tags = {
    Environment = "production"
  }

  viewer_certificate {
    cloudfront_default_certificate = true
    ssl_support_method             = "sni-only"
    acm_certificate_arn            = "	arn:aws:acm:us-east-1:292991427042:certificate/b59f8354-feaa-4a8f-8a84-43a46e8f6b60"
  }
}
