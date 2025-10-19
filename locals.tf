locals {

  all_proxmox_pools = {
    for pool in var.all_proxmox_pools : pool.pool_id => {
      pool_id = pool.pool_id
      comment = pool.comment
    }
  }

  all_proxmox_pool_acls = {
    for p in var.all_proxmox_pools : p.pool_id => merge([
      for idx, perm in try(p.permissions, []) : {
        "${p.pool_id}-acl-${idx}" = {
          path      = "/pool/${p.pool_id}"
          role_id   = perm.role_id
          propagate = perm.propagate
          token_id  = try(perm.token_id, null)
          user_id   = try(perm.user_id, null)
          group_id  = try(perm.group_id, null)
        }
      }
    ]...)
  }

}
