terraform {
  required_version = "~>1.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>3.7"
    }
  }
  backend "s3" {
    bucket = "terraform-on-aws-eks-bsbpr28"
    key = "dev/app1k8s/terraform.tfstate"
    region = "us-east-1"  

    dynamodb_table = "terraform-locks"  
  }

    
}

provider "aws" {
  region = var.aws_region
}


