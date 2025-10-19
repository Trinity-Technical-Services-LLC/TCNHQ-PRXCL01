#region ------ [ Promox Virtual Environment Systems Variable Definitions ] -------------------- #

variable "proxmox_hostname" {
  type        = string
  description = "Proxmox API endpoint, e.g., '10.69.128.49'"
}

variable "proxmox_api_token_id" {
  type        = string
  description = "Proxmox API token ID (format: user@realm!token-name)"
}

variable "proxmox_api_token_secret" {
  type        = string
  sensitive   = true
  description = "Proxmox API token secret string"
}

variable "proxmox_skip_tls_verify" {
  type        = bool
  default     = true
  description = "Whether to verify TLS certificates when connecting to the Proxmox API"
}

#endregion --- [ Promox Virtual Environment Systems Variable Definitions ] -------------------- #

#region ------ [ Proxmox Resource Variables ] ------------------------------------------------- #

  variable "all_proxmox_pools" {

    description = <<-EOT
      List of Proxmox pools to create/manage.
      - pool_id: Proxmox-compliant identifier [A-Za-z0-9._-], non-empty, unique across the list.
      - comment: Human-readable description; must include at least one non-whitespace character.
    EOT

    # Shape: [{ pool_id = "svc-...", comment = "..." }, ...]
    type = list(
      object({
        pool_id = string
        comment = string
      })
    )

    # Prevent null assignment (forces explicit empty list if you want "no pools")
    nullable = false

    # Validate pool_id charset (letters, digits, dot, hyphen, underscore)
    validation {
      condition = alltrue([
        for p in var.all_proxmox_pools :
        can(regex("^[A-Za-z0-9._-]+$", p.pool_id))
      ])
      error_message = "Each pool_id must match the regex ^[A-Za-z0-9._-]+$."
    }

    # Validate uniqueness of pool_id values
    validation {
      condition = length(var.all_proxmox_pools) == length(toset([
        for p in var.all_proxmox_pools : p.pool_id
      ]))
      error_message = "Duplicate pool_id detected. Each pool_id must be unique."
    }

    # Validate comment is not empty/whitespace-only
    validation {
      condition = alltrue([
        for p in var.all_proxmox_pools : can(regex("\\S", p.comment))
      ])
      error_message = "Each comment must contain at least one non-whitespace character."
    }

  }

#endregion --- [ Proxmox Resource Variables ] ------------------------------------------------- #
