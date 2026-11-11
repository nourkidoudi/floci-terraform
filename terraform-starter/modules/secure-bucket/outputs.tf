output "bucket" {
  description = "Nom du bucket"
  value       = aws_s3_bucket.this.bucket
}

output "arn" {
  description = "ARN du bucket"
  value       = aws_s3_bucket.this.arn
}
