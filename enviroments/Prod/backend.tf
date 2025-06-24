terraform {
  backend "s3" {
    bucket         = "itzazeem-terraform-remote-backend"
    key            = "test/terraform.tfstate"  # path inside bucket
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}