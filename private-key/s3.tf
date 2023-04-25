provider "aws" {
  access_key = "AKIAQMZRBKZATX5H3Z4G"
  secret_key = "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"
  region     = "us-east-1"
}

resource "aws_s3_bucket" "terraform-on-aws-eks-bsbpr28" {
  bucket = "terraform-on-aws-eks-bsbpr288"
  versioning {
    enabled = true
  }
}
