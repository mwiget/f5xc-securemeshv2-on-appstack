variable "ssh_public_key" {}
variable "f5xc_cluster_name" {}

variable "kubeconfig" {}

variable "master_node_count" {
  type = number
  default = 0
}
variable "worker_node_count" {
  type = number
  default = 0
}
variable "secure_mesh_node_count" {
  type = number
  default = 0
}
variable "latitude" {
  type = number
  default = 8
}
variable "longitude" {
  type = number
  default = 8
}
variable "f5xc_http_proxy" {
  type = string
  default = ""
}
variable "f5xc_api_url" {
  type = string
}
variable "f5xc_api_token" {
  type = string
}
variable "f5xc_tenant" {
  type = string
}
variable "master_cpus" {
  type = number
  default = 4
}
variable "master_memory" {
  type = number
  default = 16384
}
variable "worker_cpus" {
  type = number
  default = 4
}
variable "worker_memory" {
  type = number
  default = 16384
}
variable "secure_mesh_cpus" {
  type = number
  default = 4
}
variable "secure_mesh_memory" {
  type = number
  default = 16384
}
variable "outside_nic" {
  type = string
  default = "eth0"
}
variable "outside_network" {
  type = string
  default = "vmbr0"
}
variable "outside_network_vlan" {
  type = number
  default = -1
}
variable "inside_network" {
  type = string
  default = ""
}
variable "inside_network_vlan" {
  type = number
  default = -1
}
variable "inside_ipv4_prefix" {
  type = string
  default = "192.168.100.0/24"
}
variable "inside_dhcp_pool_start" {
  type = string
  default = "192.168.100.10"
}
variable "inside_dhcp_pool_end" {
  type = string
  default = "192.168.100.200"
}
variable "kubevirt" {
  type = bool
  default = false
}
variable "f5xc_registration_wait_time" {
    type    = number
    default = 60
}

variable "f5xc_registration_retry" {
    type    = number
    default = 20
}

variable "f5xc_tunnel_type" {
  type    = string
  default = "SITE_TO_SITE_TUNNEL_IPSEC_OR_SSL"
}

variable "operating_system_version" {
  type    = string
  default = ""
}

variable "volterra_software_version" {
  type    = string
  default = ""
}

variable "outside_macaddr" {
  type    = string
  default = ""
}

variable "inside_vip" {
  type  = string
  default = ""
}

variable "master_vm_size" {
  type = string
  default = "50G"
}

variable "worker_vm_size" {
  type = string
  default = "50G"
}

variable "master_hostpci" {
  type = list(string)
  default = []
}

variable "worker_hostpci" {
  type = list(string)
  default = []
}

variable "slo_global_vn" {
  type = string
  default = ""
}

variable "f5xc_rhel9_container" {}
