output "proxmox" {
  value = {
    master_vm               = terraform_data.master-node
    worker_vm               = terraform_data.worker-node
  }
  sensitive = true
}
