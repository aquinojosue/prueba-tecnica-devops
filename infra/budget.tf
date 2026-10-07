data "google_project" "current" {}

resource "google_monitoring_notification_channel" "billing_email" {
  display_name = "Alerta de presupuesto"
  type         = "email"

  labels = {
    email_address = var.billing_alert_email
  }
}

resource "google_billing_budget" "monthly_limit" {
  billing_account = var.billing_account_id
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
