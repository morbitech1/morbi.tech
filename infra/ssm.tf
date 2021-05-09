resource "aws_ssm_parameter" "website-bucket" {
  name  = "/website/bucket"
  type  = "String"
  value = aws_s3_bucket.website.bucket
}

resource "aws_ssm_parameter" "website-cloudfront-id" {
  name  = "/website/cloudfront/id"
  type  = "String"
  value = aws_cloudfront_distribution.s3_distribution.id
}
