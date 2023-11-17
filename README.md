# Terraform Infrastructure Setup README

This Terraform configuration file sets up an AWS environment with specific configurations for secure and controlled infrastructure deployment. It includes the creation of an S3 bucket, enabling versioning and server-side encryption, blocking public access, and creating a DynamoDB table for locking purposes.

## Prerequisites
- **Terraform**: Ensure Terraform is installed locally.
- **AWS CLI**: Configure AWS CLI with appropriate access credentials.

## Configuration Details

### AWS Provider Configuration
The provider block configures the AWS region (`us-east-2`) for resource deployment.

### S3 Bucket Creation (`aws_s3_bucket`)
- **Name**: `terraform_state`
- **Purpose**: Used to store Terraform state files.
- **Bucket Prefix**: `terraform-state-key`
- **Settings**:
    - Lifecycle configured to prevent accidental deletion.
    - Versioning enabled to maintain a history of state file revisions.
    - Server-side encryption enabled with AES256 algorithm.
    - Public access is explicitly blocked.

### DynamoDB Table Creation (`aws_dynamodb_table`)
- **Name**: `terraform_locks`
- **Purpose**: Used for locking during Terraform operations.
- **Configuration**:
    - Billing mode set to `PAY_PER_REQUEST`.
    - Single attribute defined as `LockID` of type `String`.

## Instructions for Use

1. **Setup AWS Credentials**: Ensure AWS CLI is configured with appropriate access credentials.
2. **Clone Repository**: Clone this repository to your local machine.
3. **Terraform Initialization**:
    ```bash
    terraform init
    ```
4. **Terraform Plan** (Optional): Review the execution plan before applying changes.
    ```bash
    terraform plan
    ```
5. **Terraform Apply**: Apply the Terraform configuration to create the infrastructure.
    ```bash
    terraform apply
    ```
6. **Confirmation**: Review the resources created in the AWS Console.
7. **Terraform Destroy** (Optional): To tear down the infrastructure, use:
    ```bash
    terraform destroy
    ```
    **Caution**: This will remove all created resources.

## Notes
- Ensure proper permissions are granted to AWS credentials used for Terraform deployment.
- Adjust configurations as needed based on specific project requirements.
