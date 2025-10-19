terraform {

  # Specify the required Terraform version
  required_version = "1.13.2"

  # Specify the required providers
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.83"
    }
  }

}
