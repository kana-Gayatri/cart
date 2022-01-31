terraform {
  backend "s3" {
    bucket    = "services3bucket"
    key       = "terraform-ami/cart/terraform.tfstate"
    region    = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

module "ami" {
  source      = "git::https://github.com/kana-Gayatri/terraform-ami.git"
  COMPONENT   = "cart"
  APP_VERSION = var.APP_VERSION
}

variable "APP_VERSION" {}
