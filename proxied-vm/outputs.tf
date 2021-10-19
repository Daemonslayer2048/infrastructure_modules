output "tags" {
  value = var.tags
}

output "ip" {
  value = module.Proxmox_VM.ip
}

output "mac" {
  value = module.Proxmox_VM.mac
}

output "hostname" {
  value = module.Proxmox_VM.hostname
}

output "domain" {
  value = var.searchdomain
}
