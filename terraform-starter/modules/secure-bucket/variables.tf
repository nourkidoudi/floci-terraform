variable "name" {
  description = "Nom du bucket"
  type        = string
}

variable "tags" {
  description = "Tags supplémentaires"
  type        = map(string)
  default     = {}
}
