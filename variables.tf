variable "project_prefix" {
  type        = string
  default     = "f5xc"
}

# F5XC 

variable "f5xc_api_p12_file"   {}
variable "f5xc_api_url"        {}
variable "f5xc_api_token"      {}
variable "f5xc_tenant"         {}

variable "ssh_public_key"      {}

variable "kubeconfig"     {}
variable "f5xc_rhel9_container" {}
