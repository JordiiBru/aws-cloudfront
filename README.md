# aws-cloudfront

Terraform module to create a CloudFront distribution for an S3 bucket with optional configurations.

## Required Variables

| Name      | Description                                    | Type   | Validation                                | Default |
|-----------|------------------------------------------------|--------|-------------------------------------------|---------|
| `stage`   | Stage of development                           | string | `test`, `dev`, `staging`, `prod`          | N/A     |
| `purpose` | Short description about the created resource   | string | Must match the regex `^[a-zA-Z0-9-_]*$`   | N/A     |
| `owner`   | Owner of the deployed infrastructure           | string | Must have more than three characters      | N/A     |

## Optional Variables

| Name               | Description                      | Type   | Default |
|--------------------|----------------------------------|--------|---------|
| `bucket_origin_id` | Bucket origin ID                 | string | `""`    |
| `regional_domain`  | Public bucket domain name        | string | `""`    |

## Usage

```hcl
module "cf_distr" {
  source = "../"

  # Required variables
  stage   = "test"
  owner   = "wanda"
  purpose = "tfg"

  # Optional variables
  bucket_origin_id = "s3_bucket_output" # these are orientative values
  regional_domain  = "my-s3-bucket.s3.amazonaws.com" # it should be outputs from other modules
}
```
