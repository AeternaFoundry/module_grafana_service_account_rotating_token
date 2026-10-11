resource "grafana_service_account_rotating_token" "service_account_rotating_tokens" {
  for_each = var.service_account_rotating_tokens

  early_rotation_window_seconds = each.value.early_rotation_window_seconds
  name_prefix                   = each.value.name_prefix
  seconds_to_live               = each.value.seconds_to_live
  service_account_id            = each.value.service_account_id
  delete_on_destroy             = each.value.delete_on_destroy
}

