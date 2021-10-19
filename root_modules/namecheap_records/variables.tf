########################################################
# Namecheap Related
variable "namecheap" {
  type = object({
    user      = string
    api-user  = string
    api-key   = string
    client-ip = string
    domain    = string
    sandbox   = bool
  })
}

variable "vm-name" {
  description = "The virtual machines name in Proxmox"
  type        = string
}
