provider "proxmox" {
  endpoint  = "https://var.PROXMOX_ENDPOINT/"
  api_token = "${var.PROXMOX_TOKEN_ID}@PVE!TOKENID=${var.PROXMOX_TOKEN_SECRET}"
  insecure  = true
}
