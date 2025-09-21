resource "proxmox_virtual_environment_pool" "poc" {
  pool_id = "poc-github-runner"

  comment = "Created by Terraform POC via GitHub runner"
}

# (Optional) show it back out
data "proxmox_virtual_environment_pool" "poc" {
  pool_id = proxmox_virtual_environment_pool.poc.pool_id
}
