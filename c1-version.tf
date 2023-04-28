terraform {
  required_version = "~>1.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>3.7"
    }
  }
  backend "s3" {
    bucket = "dev/app1k8s/terraform.tfstate"
    key = "dev/app1k8s/terraform.tfstate"
    region = "us-east-1"  

    dynamodb_table = "terraform-locks"  
  }

    
}

provider "aws" {
  region = var.aws_region
}


