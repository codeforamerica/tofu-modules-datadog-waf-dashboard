resource "datadog_dashboard_json" "waf" {
  dashboard = jsonencode(yamldecode(templatefile("${path.module}/templates/dashboard.yaml.tftpl", {
    default_webacls = var.default_webacls
    title = var.title
    threshold_allowed_caution = var.threshold_allowed_caution
    threshold_allowed_warning = var.threshold_allowed_warning
    threshold_blocked_caution = var.threshold_blocked_caution
    threshold_blocked_warning = var.threshold_blocked_warning
    threshold_counted_caution = var.threshold_counted_caution
    threshold_counted_warning = var.threshold_counted_warning
    threshold_limited_caution = var.threshold_limited_caution
    threshold_limited_warning = var.threshold_limited_warning
  })))
}
