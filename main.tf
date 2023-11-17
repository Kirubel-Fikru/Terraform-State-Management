provider "aws" {
 region = "us-east-2"
}

# create an S3 bucket by using the aws_s3_bucket resource:
resource "aws_s3_bucket" "terraform_state" {
 bucket = "terraform-up-and-running-state"
 # Prevent accidental deletion of this S3 bucket
 lifecycle {
 prevent_destroy = true
 }
}
