# More on: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#attribute-reference
output "distribution_arn" {
  description = "The ARN of the CloudFront distribution."
  value       = aws_cloudfront_distribution.main_distribution[*].arn
}

output "distribution_domain_name" {
  description = "The domain name of the CloudFront distribution."
  value       = aws_cloudfront_distribution.main_distribution[*].domain_name
}

output "distribution_zone_id" {
  description = "CloudFront Route 53 zone ID."
  value       = aws_cloudfront_distribution.main_distribution[*].hosted_zone_id
}