resource "proxmox_vm_qemu" "Proxmox_VM" {
  name         = var.vm-name
  target_node  = var.node
  vmid         = var.vm-id
  desc         = var.desc
  tags         = var.tags
  clone        = var.template-name
  memory       = var.mem
  cores        = var.cpu
  ciuser       = var.cloud_init.user
  cipassword   = var.cloud_init.pass
  sshkeys      = var.cloud_init.ssh_keys
  ipconfig0    = "gw=${var.gateway},ip=${var.network}.${var.vm-id}/${var.network_subnet}"
  nameserver   = var.nameservers
  searchdomain = var.searchdomain
  pool         = var.pool
  agent        = 1
  network {
    model     = var.net0-model
    bridge    = var.net0-bridge
    tag       = var.net0-tag
    firewall  = var.net0-firewall
    link_down = var.net0-link-down
  }
  disk {
    size      = var.disk0-size
    type      = var.disk0-type
    storage   = var.disk0-storage
    backup    = var.disk0-backup
    replicate = var.disk0-replicate
  }
  lifecycle {
    ignore_changes = [
      network
    ]
  }
}
