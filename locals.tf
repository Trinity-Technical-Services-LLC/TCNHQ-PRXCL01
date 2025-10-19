locals {

  all_proxmox_pools = {
    for pool in var.all_proxmox_pools : pool.pool_id => {
      pool_id = pool.pool_id
      comment = pool.comment
    }

  }
}
