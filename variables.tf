variable "service_account_rotating_tokens" {
  description = <<EOT
Map of service_account_rotating_tokens, attributes below
Required:
    - early_rotation_window_seconds
    - name_prefix
    - seconds_to_live
    - service_account_id
Optional:
    - delete_on_destroy
EOT

  type = map(object({
    early_rotation_window_seconds = number
    name_prefix                   = string
    seconds_to_live               = number
    service_account_id            = string
    delete_on_destroy             = optional(bool)
  }))
  validation {
    condition = alltrue([
      for k, v in var.service_account_rotating_tokens : (
        v.seconds_to_live >= 0
      )
    ])
    error_message = "must be at least 0"
  }
  validation {
    condition = alltrue([
      for k, v in var.service_account_rotating_tokens : (
        v.early_rotation_window_seconds >= 0
      )
    ])
    error_message = "must be at least 0"
  }
}

