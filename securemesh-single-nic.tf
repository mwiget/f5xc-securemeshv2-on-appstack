module "securemesh-single-nic" {
  count                   = 1
  source                  = "./appstack"
  f5xc_cluster_name       = format("%s-smsv2-%d", var.project_prefix, count.index)
  kubeconfig              = var.kubeconfig
  f5xc_rhel9_container    = var.f5xc_rhel9_container


  master_node_count       = 1
  worker_node_count       = 0

  master_cpus             = 4
  master_memory           = 16384

  worker_cpus             = 4
  worker_memory           = 16384

  latitude                = 47
  longitude               = 8.5
  ssh_public_key          = var.ssh_public_key
  outside_network         = "ves-system/mw-milan1-enp193s0f1-0-vfio"  # temp used as SLI
  outside_nic             = "enp1s0"

  # set  to generate fixed  macaddr per node (last octet set to node index)
  # outside_macaddr       = "02:02:02:00:00:00"   

  f5xc_tenant             = var.f5xc_tenant
  f5xc_api_url            = var.f5xc_api_url
  f5xc_api_token          = var.f5xc_api_token
}
