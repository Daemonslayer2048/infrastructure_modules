########################################################
# Ansible Host Tags
variable "tags" {
  type = list(object({
      key   = string
      value = string
  }))
}

########################################################
# Unifi Related
variable "unifi" {
  type = object({
    user = string
    pass = string
    url  = string
  })
}

variable "unifi_site" {
  description = "The Site a Rule Should Apply To"
  type        = string
  default     = "Default" # This is literally the default name, if you never set a site name this is it
  sensitive   = true
}

variable "unifi-network-name" {
  description = "The name of the network (in UniFi) that the server will exist in."
  type        = string
}

# This is claimed to be deprecated, however, failing to
# include this will result in it being disabled.
variable "enabled" {
  description = "To enable to rule or not"
  type = bool
  default = true
}

variable "unifi-note" {
  description = "A note in the unifi UI for a client."
  type        = string
  default     = "A VM made by terragrunt"
}

########################################################
# Proxmox Related
variable "proxmox" {
  type = object({
    user = string
    pass = string
    url  = string
  })
}

variable "cloud_init" {
  type = object({
      user     = string
      pass     = string
      ssh_keys = string
  })
}

variable "node" {
  description = "The node name (in Proxmox) to deploy the VM on"
  type        = string
}

variable "template-name" {
  description = "The template to clone the VM from (this must be on the same physical host)"
  type        = string
  default     = "CentOS-Stream-Template"
}

variable "vm-name" {
  description = "The virtual machines name in Proxmox"
  type        = string
}

variable "onboot" {
  description = "Start the VM when the node boots"
  type        = bool
  default     = true
}

variable "vm-id" {
  description = "The VM id to set, must be at least 3 digits"
  type        = number
  default     = 0
}

variable "desc" {
  description = "The decritpion for the VM (supports markdown)"
  type        = string
  default     = <<-EOT
  Default description as created by terragrunt and terraform.
  EOT
}

variable "pool" {
  description = "The pool to add the VM to"
  type        = string
}

variable "mem" {
  description = "The total memory (in MB) to give the VM"
  type        = number
  default     = 2048
}

variable "cpu" {
  description = "The number of vCPUs to give the VM"
  type        = number
  default     = 4
}

variable "disk0-size" {
  description = "The disk size to give the VM (a string not int)"
  type        = string
  default     = "100G"
}

variable "disk0-type" {
  description = "The disk connection type"
  type        = string
  default     = "scsi"
}

variable "disk0-storage" {
  description = "The disk size to give the VM (a string not int)"
  type        = string
  default     = "local-zfs"
}

variable "disk0-backup" {
  description = "A bollean to decide if the disk should be backed up (1 is true)"
  type        = number
  default     = 1
}

variable "disk0-replicate" {
  description = "A bollean to decide if the disk should be added to replication jobs (1 is true)"
  type        = number
  default     = 1
}

variable "ipconfig" {
  description = "Sets the IP of the new VM, Example: gw=192.168.10.1,ip=192.168.10.2/24"
  type        = string
  default     = "ip=dhcp"
}

variable "nameservers" {
  description = "Nameservers to set for VMs"
  type        = string
  default     = "10.0.0.2, 10.0.0.3"
}

variable "searchdomain" {
  description = "Search Domain to set for VMs"
  type        = string
  default     = "infra.lan"
}

variable "net0-model" {
  description = "The device model to use"
  type        = string
  default     = "virtio"
}

variable "net0-bridge" {
  description = "The bridge name to attach the net device to"
  type        = string
  default     = "vmbr0"
}

variable "net0-tag" {
  description = "The VLAN tag to use"
  type        = string
  default     = -1
}

variable "net0-firewall" {
  description = "To enable proxmox firewall or not"
  type        = string
  default     = false
}

variable "net0-link-down" {
  description = "To enable or disable the network device"
  type        = bool
  default     = false
}
