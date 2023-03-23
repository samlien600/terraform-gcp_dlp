resource "google_bigquery_dataset" "dataset" {
  dataset_id                  = "kite_demo_dataset"
  location                    = var.gcp_location

  labels = {
    env = "kite_demo_dataset"
  }
}

resource "google_bigquery_table" "table" {
  dataset_id = google_bigquery_dataset.dataset.dataset_id
  table_id   = "kite_demo_table"

  schema = <<EOF
    [
        {
            "name": "int64_field_0",
            "type": "INTEGER",
            "mode": "NULLABLE"
        },
        {
            "name": "id",
            "type": "INTEGER",
            "mode": "NULLABLE"
        },
        {
            "name": "name",
            "type": "STRING",
            "mode": "NULLABLE"
        },
        {
            "name": "identity",
            "type": "STRING",
            "mode": "NULLABLE",
            "policyTags": {
                "names": [
                    "${var.policy_tag_crime_id}"
                ]
            }
        },
        {
            "name": "birth",
            "type": "DATE",
            "mode": "NULLABLE"
        },
        {
            "name": "phone",
            "type": "INTEGER",
            "mode": "NULLABLE"
        },
        {
            "name": "region",
            "type": "STRING",
            "mode": "NULLABLE"
        },
        {
            "name": "crime",
            "type": "BOOLEAN",
            "mode": "NULLABLE"
        }
    ]
    EOF
}