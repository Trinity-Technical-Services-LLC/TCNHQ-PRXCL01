provider "proxmox" {
  endpoint   = var.PROXMOX_ENDPOINT
  api_token  = "${var.PROXMOX_API_TOKEN_ID}=${var.PROXMOX_API_TOKEN_SECRET}"
  verify_tls = var.PROXMOX_VERIFY_TLS
}
