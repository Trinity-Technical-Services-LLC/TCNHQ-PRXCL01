variable "PROXMOX_ENDPOINT" {
  type        = string
  description = "Proxmox API endpoint, e.g., https://10.69.128.49:8006/"
}

variable "PROXMOX_TOKEN_ID" {
  type        = string
  description = "Proxmox API token ID (format: user@realm!token-name)"
}

variable "PROXMOX_TOKEN_SECRET" {
  type        = string
  sensitive   = true
  description = "Proxmox API token secret string"
}

variable "PROXMOX_VERIFY_TLS" {
  type        = bool
  default     = true
  description = "Whether to verify TLS certificates when connecting to the Proxmox API"
}
