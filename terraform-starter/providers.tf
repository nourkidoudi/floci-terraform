terraform {
  required_version = ">= 1.10"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Provider AWS redirigé vers Floci : aucun appel ne part vers le vrai AWS.
provider "aws" {
  region     = var.region
  access_key = "test" # identifiants fictifs, acceptés par Floci
  secret_key = "test"

  # Ne pas contacter les services d'authentification et de métadonnées du vrai AWS.
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  s3_use_path_style           = true # http://localhost:4566/<bucket> au lieu de <bucket>.s3.amazonaws.com

  endpoints {
    s3             = var.floci_endpoint
    sqs            = var.floci_endpoint
    dynamodb       = var.floci_endpoint
    secretsmanager = var.floci_endpoint
    lambda         = var.floci_endpoint
    iam            = var.floci_endpoint
    sts            = var.floci_endpoint
  }

  default_tags {
    tags = {
      project     = "tp13"
      environment = var.environment
      managed-by  = "terraform"
    }
  }
}
