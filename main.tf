provider "aws" {
    region = "us-east-2"
}

# create an S3 bucket by using the aws_s3_bucket resource:
resource "aws_s3_bucket" "terraform_state" {
    bucket = "terraform-key-for-backend"
    # Prevent accidental deletion of this S3 bucket
    lifecycle {
        prevent_destroy = true 
    }
}

# Enable versioning so you can see the full revision history of your state files
resource "aws_s3_bucket_versioning" "enabled" {
    bucket = aws_s3_bucket.terraform_state.id
    versioning_configuration {
    status = "Enabled"
 }
}

