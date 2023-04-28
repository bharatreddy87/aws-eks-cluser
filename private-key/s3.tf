provider "aws" {
    region     = "us-east-1"
}

resource "aws_s3_bucket" "terraform-on-aws-eks-bsbpr87" {
  bucket = "terraform-on-aws-eks-bsbpr87"
  versioning {
    enabled = true
  }
}
