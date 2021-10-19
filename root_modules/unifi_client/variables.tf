variable "unifi" {
  type = object({
    user = string
    pass = string
    url  = string
  })
}

variable "mac" {
  description = "The MAC address of the VM to add as a client."
  type        = string
}

variable "name" {
  description = "The name of the client to add."
  type        = string
}

variable "fixed_ip" {
  description = "The static IP to assign to the VM."
  type        = string
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

variable "unifi-note" {
  description = "A note in the unifi UI for a client."
  type        = string
  default     = "A VM made by terragrunt"
}
