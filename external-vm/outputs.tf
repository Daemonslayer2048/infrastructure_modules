output "tags" {
  value = proxmox_vm_qemu.Proxmox_VM.tags
}

output "host_net" {
  value = {
    ip        = proxmox_vm_qemu.Proxmox_VM.ssh_host
    mac       = proxmox_vm_qemu.Proxmox_VM.network[0].macaddr
    host_name = proxmox_vm_qemu.Proxmox_VM.name
    domain    = var.searchdomain
  }
}
