resource "aws_s3_bucket" "website" {
  bucket_prefix = "website"
  acl           = "private"

  tags = {
    Environment = "production"
  }
}

resource "aws_s3_bucket_policy" "default" {
  bucket = aws_s3_bucket.website.id
  policy = <<EOF
{
  "Version": "2008-10-17",
  "Statement": [
      {
          "Sid": "2",
          "Effect": "Allow",
          "Principal": {
              "AWS": "${aws_cloudfront_origin_access_identity.website.iam_arn}"
          },
          "Action": "s3:*",
          "Resource": "${aws_s3_bucket.website.arn}"
      }
    ]
}
EOF
}

locals {
  s3_origin_id = "morbi.tech"
}
