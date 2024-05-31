# aws-cloudfront

Terraform module to create a CloudFront distribution for a hosting S3 bucket with optional configurations.

## Required Variables

| Name      | Description                                    | Type   | Validation                                | Default |
|-----------|------------------------------------------------|--------|-------------------------------------------|---------|
| `stage`   | The stage of development (e.g., test, dev, staging, prod). | string | Must be one of `test`, `dev`, `staging`, `prod` | N/A     |
| `purpose` | A short description about the purpose of the created resource. | string | Must match the regex `^[a-zA-Z0-9-_]*$`   | N/A     |
| `owner`   | The owner of the deployed infrastructure.      | string | Must have more than three characters      | N/A     |

## Custom Variables

| Name               | Description                               | Type   | Default              |
|--------------------|-------------------------------------------|--------|----------------------|
| `bucket_origin_id` | The ID of the hosting S3 bucket origin.   | string | `""`                 |
| `regional_domain`  | The regional domain name of the hosting S3 bucket. | string | `""`                 |
| `cert_id`          | The ARN of the SSL certificate to attach to the CloudFront distribution. | string | `""`                 |
| `domain_name`      | The name of the domain.                   | string | `""`                 |

## Outputs

| Name               | Description                                          |
|--------------------|------------------------------------------------------|
| `cf_distr_arn`     | The ARN of the CloudFront distribution.              |
| `cf_domain_name`   | The domain name of the CloudFront distribution.      |
| `cf_zone_id`       | The hosted zone ID of the CloudFront distribution.   |

## Usage

```hcl
module "cf_distr" {
  source = "git@github.com:JordiiBru/aws-cloudfront.git?ref=[TAG]"

  # Required variables
  stage   = "dev"
  owner   = "wanda"
  purpose = "tfg"

  # Custom variables
  bucket_origin_id = "s3_bucket_output"              # these are orientative values
  regional_domain  = "my-s3-bucket.s3.amazonaws.com" # it should be outputs from other modules
}
```