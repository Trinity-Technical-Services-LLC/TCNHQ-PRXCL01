all_proxmox_pools = [
  {
    pool_id = "tmpl-golden-pkr"
    comment = "Golden VM Templates Built By Packer"
    permissions = [
      {
        propagate = true
        role_id   = "PVETemplateUser"
        token_id  = "root@pam!proxmox-terraform-framework"
      }
    ]
  },
  {
    pool_id = "svc-herowars-core"
    comment = "Hero Wars Services Group"
    permissions = [
      {
        propagate = true
        role_id   = "PVEVMAdmin"
        token_id  = "root@pam!proxmox-terraform-framework"
      }
    ]
  },
]
