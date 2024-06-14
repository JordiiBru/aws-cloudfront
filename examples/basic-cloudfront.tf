module "cf_distr" {
  source = "../"

  # Common variables
  stage   = "test"
  owner   = "wanda"
  purpose = "tfg"

  # Custom variables
  website_endpoint = "my-s3-bucket.s3-website-eu-west-1.amazonaws.com"
  regional_domain  = "my-s3-bucket.s3.amazonaws.com"
  cert_arn         = "XXX" # existing certificate
}