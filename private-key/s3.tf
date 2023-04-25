provider "aws" {
  access_key = "AKIA2FTTSXCQGBFTFZ4A"
  secret_key = "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"
  region     = "us-east-1"
}

resource "aws_s3_bucket" "terraform-on-aws-eks-bsbpr28" {
  bucket = "terraform-on-aws-eks-bsbpr28"
  versioning {
    enabled = true
  }
}
