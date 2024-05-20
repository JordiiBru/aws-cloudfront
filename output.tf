# More on: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#attribute-reference
output "cf_distr_arn" {
  value = aws_cloudfront_distribution.main_distribution[*].arn
}

output "cf_domain_name" {
  value = aws_cloudfront_distribution.main_distribution[*].domain_name
}

output "cf_zone_id" {
  value = aws_cloudfront_distribution.main_distribution[*].hosted_zone_id
}