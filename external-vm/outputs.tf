output "tags" {
  value = proxmox_vm_qemu.Proxmox_VM.tags
}

output "ip" {
  value = proxmox_vm_qemu.Proxmox_VM.ssh_host
}

output "mac" {
  value = proxmox_vm_qemu.Proxmox_VM.network[0].macaddr
}

output "hostname" {
  value = proxmox_vm_qemu.Proxmox_VM.name
}

output "domain" {
  value = var.searchdomain
}
