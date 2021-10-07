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

provider "namecheap" {
  user_name   = var.namecheap.user
  api_user    = var.namecheap.api-user
  api_key     = var.namecheap.api-key
  client_ip   = var.namecheap.client-ip
  use_sandbox = var.namecheap.sandbox
}
