variable "api_key" {
  type      = string
  sensitive = true
}

resource "google_secret_manager_secret" "api_key" {
  secret_id = "api-key"

  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "api_key" {
  secret      = google_secret_manager_secret.api_key.id
  secret_data = var.api_key
}
