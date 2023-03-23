terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.16.0"
    }
  }
}
 
provider "google" {
  credentials = file(var.gcp_credential)
  project     = var.gcp_project_id
  region      = var.gcp_region
}

provider "google-beta" {
  credentials = file(var.gcp_credential)
  project     = var.gcp_project_id
  region      = var.gcp_region
}

module "gcp_dataplex" {
  source              = "./modules/dataplex"
  gcp_taxonomy_region = var.gcp_taxonomy_region
}

module "gcp_bigquery" {
  source              = "./modules/bigquery"
  gcp_location        = var.gcp_location
  policy_tag_crime_id = module.gcp_dataplex.policy_tag_crime_id
}