data "google_project" "current" {}

data "google_billing_account" "current" {
  billing_account = data.google_project.current.billing_account
}

resource "google_monitoring_notification_channel" "billing_email" {
  display_name = "Alerta de presupuesto"
  type         = "email"

  labels = {
    email_address = var.billing_alert_email
  }
}

resource "google_billing_budget" "monthly_limit" {
  billing_account = data.google_billing_account.current.id
  display_name    = "Limite mensual de la prueba"

  budget_filter {
    projects = ["projects/${data.google_project.current.number}"]
  }

  amount {
    specified_amount {
      currency_code = "USD"
      units         = "10"
    }
  }

  threshold_rules {
    threshold_percent = 0.5
  }

  threshold_rules {
    threshold_percent = 0.9
  }

  threshold_rules {
    threshold_percent = 1
  }
}
