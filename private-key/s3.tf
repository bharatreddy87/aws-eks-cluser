provider "aws" {
    region     = "us-east-1"
}

resource "aws_s3_bucket" "terraform-on-aws-eks-bsbpr28" {
  bucket = "terraform-on-aws-eks-bsbpr281"
  versioning {
    enabled = true
  }
}
