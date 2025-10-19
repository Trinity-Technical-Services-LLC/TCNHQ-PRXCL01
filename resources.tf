resource "proxmox_virtual_environment_pool" "all_pools" {

  # Itterate over all Proxmox pools defined in locals
  for_each = local.all_proxmox_pools

    pool_id = each.value.pool_id
    comment = each.value.comment

}
