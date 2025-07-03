terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
}

locals {
  RESOURCES_PREFIX = "${lower(var.ENV)}-rivemation"
 
  
  
  common_tags = {
    environment = var.ENV
    project     = "rivemation"
  }
}


module "s3" {
  source           = "./module/s3"
  RESOURCES_PREFIX = local.RESOURCES_PREFIX
}

  module "cloudfront" {
  source                      = "./module/cloudfront"
  S3_BUCKET_NAME              =module.s3.S3_BUCKET_NAME
}