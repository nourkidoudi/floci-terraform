# TP13 partie 4 : à renommer en backend.tf APRÈS avoir créé le bucket "tp13-tfstate" (bootstrap).
# Puis : terraform init -migrate-state
terraform {
  backend "s3" {
    bucket = "tp13-tfstate"
    key    = "envs/dev/terraform.tfstate"
    region = "us-east-1"

    access_key = "test"
    secret_key = "test"

    endpoints = {
      s3 = "http://localhost:4566"
      # dynamodb = "http://localhost:4566"   # uniquement pour le verrouillage par table DynamoDB
    }
    use_path_style              = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_metadata_api_check     = true
    skip_region_validation      = true

    # Verrouillage natif S3 (Terraform >= 1.10) : un fichier .tflock est créé à côté du state.
    use_lockfile = true
    # Alternative historique (dépréciée) : dynamodb_table = "tp13-tflock"
  }
}
