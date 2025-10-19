locals {

  all_proxmox_pools = {
    for pool in var.all_proxmox_pools : pool.pool_id => {
      pool_id = pool.pool_id
      comment = pool.comment
    }
  }

  all_proxmox_pool_acls = {
    for pool in var.all_proxmox_pools : pool.pool_id => merge([
      for idx, acl in try(pool.permissions, []) : {
        "${pool.pool_id}-acl-${idx}" = {
          path      = "/pool/${p.pool_id}"
          role_id   = acl.role_id
          propagate = acl.propagate
          token_id  = try(acl.token_id, null)
          user_id   = try(acl.user_id, null)
          group_id  = try(acl.group_id, null)
        }
      }
    ]...)
  }

}
