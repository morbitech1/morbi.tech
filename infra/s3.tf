resource "aws_s3_bucket" "website" {
  bucket_prefix = "website"
  acl = "private"

  tags = {
    Environment = "production"
  }
}

locals {
  s3_origin_id = "morbi.tech"
}
