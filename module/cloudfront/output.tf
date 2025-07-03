
# output "cloudfrontId" {
#   value = aws_cloudfront_distribution.frontend_distribution.id
# }

# output "cloudfront_url" {
#   description = "CloudFront Distribution URL"
#   value       = "https://${aws_cloudfront_distribution.my_cf.domain_name}"
# }
output "cloudfront_url" {
  value = aws_cloudfront_distribution.rivemation_cf.domain_name
}