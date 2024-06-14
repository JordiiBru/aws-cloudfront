# aws-cloudfront

Terraform module to create a CloudFront distribution for a hosting S3 bucket with optional configurations.

## Common Variables

| Name      | Description                                                    | Type   | Validation                                      | Default  | Required  |
|-----------|----------------------------------------------------------------|--------|-------------------------------------------------|----------|-----------|
| `stage`   | The stage of development (e.g., test, dev, staging, prod).     | string | Must be one of `test`, `dev`, `staging`, `prod` |          | yes       |
| `purpose` | A short description about the purpose of the created resource. | string | Must match the regex `^[a-zA-Z0-9-_]*$`         |          | yes       |
| `owner`   | The owner of the deployed infrastructure.                      | string | Must have more than three characters            |          | yes       |

## Custom Variables

| Name               | Description                                                              | Type   | Validation                                                       | Default | Required |
|--------------------|--------------------------------------------------------------------------|--------|------------------------------------------------------------------|---------|----------|
| `website_endpoint` | S3 bucket website endpoint.                                              | string |                                                                  |         | yes      |
| `regional_domain`  | The regional domain name of the hosting S3 bucket.                       | string |                                                                  |         | yes      |
| `cert_arn`         | The ARN of the SSL certificate to attach to the CloudFront distribution. | string |                                                                  |         | yes      |
| `subdomain`        | The name of the subdomain.                                               | string | You must define a subdomain name with at least three characters. |         | yes      |

## Outputs

| Name                       | Description                                          |
|----------------------------|------------------------------------------------------|
| `distribution_arn`         | The ARN of the CloudFront distribution.              |
| `distribution_domain_name` | The domain name of the CloudFront distribution.      |
| `distribution_zone_id`     | CloudFront Route 53 zone ID.                         |

## Usage

```hcl
module "cf_distr" {
  source = "git@github.com:JordiiBru/aws-cloudfront.git?ref=[TAG]"

  # Common variables
  stage   = "test"
  owner   = "wanda"
  purpose = "tfg"

  # Custom variables
  website_endpoint = "my-s3-bucket.s3-website-eu-west-1.amazonaws.com"
  regional_domain  = "my-s3-bucket.s3.amazonaws.com"
  cert_arn         = "XXX" # existing certificate
}
```