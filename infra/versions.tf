terraform {
  required_version = ">= 1.5.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
  }

  backend "gcs" {
    bucket = "prueba-tecnica-devops-1bd563-tfstate"
    prefix = "consulta-tramites"
  }
}
