#region ------ [ Proxmox Pool Configuration ] ------------------------------------------------- #

  resource "proxmox_virtual_environment_pool" "all_pools" {

    # Itterate over all Proxmox pools defined in locals
    for_each = local.all_proxmox_pools

      pool_id = each.value.pool_id
      comment = each.value.comment

  }

  resource "proxmox_virtual_environment_acl" "all_pool_acls" {

    for_each = local.all_proxmox_pool_acls

      path      = each.value.path
      role_id   = each.value.role_id
      propagate = each.value.propagate
      token_id  = each.value.token_id
      user_id   = each.value.user_id
      group_id  = each.value.group_id

  }

#endregion --- [ Proxmox Pool Configuration ] ------------------------------------------------- #

