
terraform {
  backend "s3"{
    bucket="terraform-backend-qa"
    key="global/terraform/terraform.tfstate"
    region = "us-east-1"
  }

  required_providers{
    aws= {
        source = "hashicorp/aws"
        version = "~> 4.51.0"        
    }
  }
}

provider "aws" {
  region = "${var.region}"
}











