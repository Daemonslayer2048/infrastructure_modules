provider "proxmox" {
  pm_api_url      = var.proxmox.url
  pm_user         = var.proxmox.user
  pm_password     = var.proxmox.pass
  pm_tls_insecure = true
}

provider "unifi" {
  username = var.unifi.user # optionally use UNIFI_USERNAME env var
  password = var.unifi.pass # optionally use UNIFI_PASSWORD env var
  api_url  = var.unifi.url  # optionally use UNIFI_API env var
  allow_insecure = true
}

module "Proxmox_VM" {
  # Source Module
  source = "../root_modules//proxmox_vm"
  # Proxmox Provider
  proxmox = var.proxmox
  # VM Data
  vm-name         = var.vm-name
  node            = var.node
  desc            = var.desc
  template-name   = var.template-name
  mem             = var.mem
  cpu             = var.cpu
  cloud_init      = var.cloud_init
  ipconfig        = var.ipconfig
  nameservers     = var.nameservers
  onboot          = var.onboot
  searchdomain    = var.searchdomain
  pool            = var.pool
  net0-model      = var.net0-model
  net0-bridge     = var.net0-bridge
  net0-tag        = var.net0-tag
  net0-firewall   = var.net0-firewall
  net0-link-down  = var.net0-link-down
  disk0-size      = var.disk0-size
  disk0-type      = var.disk0-type
  disk0-storage   = var.disk0-storage
  disk0-backup    = var.disk0-backup
  disk0-replicate = var.disk0-replicate
}

module "UniFi_Client" {
  # Source Module
  source             = "../root_modules//unifi_client"
  # Proxmox Provider
  unifi              = var.unifi
  # UnifClient Data
  name               = "${var.vm-name}.${var.searchdomain}"
  mac                = "${module.Proxmox_VM.mac}"
  unifi-note         = var.unifi-note
  fixed_ip           = "${module.Proxmox_VM.ip}"
  unifi-network-name = var.unifi-network-name
  # Dependencies
  depends_on         = [module.Proxmox_VM.ip]
}

module "UniFi_Port_Forward_Rules" {
  # Source Module
  source        = "../root_modules//unifi_portforwards"
  # Proxmox Provider
  unifi         = var.unifi
  # Rules
  fixed_ip      = "${module.Proxmox_VM.ip}"
  port_forwards = var.port_forwards
  # Dependencies
  depends_on         = [module.Proxmox_VM.ip]
}
