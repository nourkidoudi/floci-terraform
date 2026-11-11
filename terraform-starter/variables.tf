variable "region" {
  description = "Région AWS simulée"
  type        = string
  default     = "us-east-1"
}

variable "floci_endpoint" {
  description = "URL du endpoint Floci"
  type        = string
  default     = "http://localhost:4566"
}

variable "environment" {
  description = "Nom de l'environnement (dev, staging, prod)"
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "environment doit valoir dev, staging ou prod."
  }
}

variable "api_key" {
  description = "Valeur du secret (ne jamais la mettre dans le code)"
  type        = string
  sensitive   = true
}
