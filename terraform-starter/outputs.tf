output "bucket_name" {
  description = "Nom du bucket S3 créé"
  value       = module.uploads.bucket
}

# TODO : exposer l'URL de la file SQS et le nom de la table DynamoDB

output "queue_url" {
  description = "URL de la file SQS"
  value       = aws_sqs_queue.contact.url
}

output "table_name" {
  description = "Nom de la table DynamoDB"
  value       = aws_dynamodb_table.visits.name
}

output "backups_bucket_name" {
  description = "Nom du bucket de sauvegarde"
  value       = module.backups.bucket
}
