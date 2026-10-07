output "project_id" {
  value = var.project_id
}

output "region" {
  value = var.region
}

output "artifact_registry_repository" {
  value = google_artifact_registry_repository.app.name
}

output "api_key_secret" {
  value = google_secret_manager_secret.api_key.secret_id
}
