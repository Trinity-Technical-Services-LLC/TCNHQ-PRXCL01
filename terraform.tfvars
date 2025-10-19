all_proxmox_pools = [
  {
    pool_id = "tmpl-golden-pkr"
    comment = "Golden VM templates built by Packer"
  },
  {
    pool_id = "svc-herowars-core"
    comment = "Hero Wars service group: 3x simulation servers, Web Orchestrator, and Hono server (RBAC/backup scope)."
  },
]
