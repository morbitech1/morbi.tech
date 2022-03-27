terraform {
  backend "s3" {
    bucket         = "terraform-state20220327113304704200000003"
    key            = "global/s3/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "terraform-up-and-running-locks"
    encrypt        = true
  }
}