output "ansible_host" {
  value = {
    ip          = "${module.Proxmox_VM.ip}"
    hostname    = "${module.Proxmox_VM.hostname}"
    domain      = "${var.searchdomain}"
    mac         = "${module.Proxmox_VM.mac}"
    nameservers = "${var.nameservers}"
    tags        = "${var.tags}"
  }
}
