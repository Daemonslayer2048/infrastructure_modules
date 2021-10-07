terraform {
  required_providers {
    // For notes on how to install this provider: https://github.com/Telmate/terraform-provider-proxmox/blob/master/docs/guides/installation.md
    proxmox = {
      source = "telmate/proxmox"
      version = ">=2.7.4"
    }
    unifi = {
      source = "paultyng/unifi"
      version = ">=0.30.1"
    }
  }
}
