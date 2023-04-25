provider "aws" {
  access_key = "AKIA3IEBEKSRQUT6NG74"
  secret_key = "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"
  region     = "us-east-1"
}

resource "aws_s3_bucket" "terraform-on-aws-eks-bsbpr28" {
  bucket = "terraform-on-aws-eks-bsbpr288"
  versioning {
    enabled = true
  }
}
