provider "proxmox" {
  endpoint  = "https://${var.PROXMOX_ENDPOINT}/"
  api_token = "${var.PROXMOX_TOKEN_ID}=${var.PROXMOX_TOKEN_SECRET}"
  insecure  = true
}
