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

output "runtime_service_account" {
  value = google_service_account.runtime.email
}

output "deployer_service_account" {
  value = google_service_account.deployer.email
}

output "workload_identity_provider" {
  value = google_iam_workload_identity_pool_provider.github.name
}

output "cloud_run_url" {
  value = google_cloud_run_v2_service.api.uri
}
