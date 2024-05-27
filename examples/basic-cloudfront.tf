module "cf_distr" {
  source = "../"

  # Required variables
  stage   = "test"
  owner   = "wanda"
  purpose = "tfg"

  # Custom variables
  bucket_origin_id = "s3_bucket_output"              # these are orientative values
  regional_domain  = "my-s3-bucket.s3.amazonaws.com" # it should be outputs from other modules
}