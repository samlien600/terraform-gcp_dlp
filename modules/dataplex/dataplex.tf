resource "google_data_catalog_taxonomy" "taxonomy" {
  provider                = google-beta
  region                  = var.gcp_taxonomy_region
  display_name            =  "kite_taxonomy"
  description             = "terraform demo"
  activated_policy_types  = ["FINE_GRAINED_ACCESS_CONTROL"]
}

resource "google_data_catalog_policy_tag" "policy_tag_crime" {
  provider = google-beta
  taxonomy = google_data_catalog_taxonomy.taxonomy.id
  display_name = "crime_data"
  description = "crime demo"
}

resource "google_bigquery_datapolicy_data_policy" "policy_crime" {
  provider         = google-beta
  location         = var.gcp_taxonomy_region
  data_policy_id   = "policy_crime"
  policy_tag       = google_data_catalog_policy_tag.policy_tag_crime.id
  data_policy_type = "DATA_MASKING_POLICY"
  data_masking_policy {
    predefined_expression = "ALWAYS_NULL"
  }
}
