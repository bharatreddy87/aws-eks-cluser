provider "aws" {
  access_key = "AKIAZYBNKTFCPLNRUT55"
  secret_key = "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"
  region     = "us-east-1"
}

resource "aws_s3_bucket" "terraform-on-aws-eks-bsbpr28" {
  bucket = "terraform-on-aws-eks-bsbpr28"
  versioning {
    enabled = true
  }
}
