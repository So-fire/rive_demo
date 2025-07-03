# terraform {
#   backend "s3" {
#     encrypt = true
#     bucket  = "rivemation-tf-state-bucket"
#     key     = "backend/rivemation.tfstate"
#     region  = "us-east-1"
#     # profile        = "default"
#   }
# }