resource "google_artifact_registry_repository" "app" {
  repository_id = "consulta-tramites"
  location      = var.region
  format        = "DOCKER"
  description   = "Imagenes de la API de consulta de tramites"
}
