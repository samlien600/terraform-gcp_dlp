variable "gcp_credential" {
  type        = string
  description = "gcp credential"
}

variable "gcp_project_id" {
  type        = string
  description = "gcp project id"
}

# https://cloud.google.com/compute/docs/regions-zones
variable "gcp_region" {
  type        = string
  description = "gcp region"
}

variable "gcp_location" {
  type        = string
  description = "gcp bigquery location"
}

variable "gcp_taxonomy_region" {
  type        = string
  description = "gcp taxonomy region"
}