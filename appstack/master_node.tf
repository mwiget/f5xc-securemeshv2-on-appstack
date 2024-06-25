resource "terraform_data" "master-node" {
  count      = var.master_node_count
  depends_on = [ local_file.kubectl_manifest_master ]
  input      = {
    manifest   = "manifest/${var.f5xc_cluster_name}_m${count.index}.yaml"
    kubeconfig = var.kubeconfig
    name       = "${var.f5xc_cluster_name}-m${count.index}"
  }

  provisioner "local-exec" {
    command    = "kubectl apply -f ${self.input.manifest} --kubeconfig ${self.input.kubeconfig} && kubectl wait --for=condition=ready pod -l vm.kubevirt.io/name=${self.input.name} --kubeconfig ${self.input.kubeconfig}"
  }
  provisioner "local-exec" {
    when       = destroy
    on_failure = continue
    command    = "kubectl delete -f ${self.input.manifest} --kubeconfig ${self.input.kubeconfig}"
  }
}

resource "local_file" "kubectl_manifest_master" {
    count                    = var.master_node_count
    content                  = templatefile("${path.module}/templates/rhel9-node-template.yaml", {
    cluster-name             = var.f5xc_cluster_name
    host-name                = format("m%d", count.index)
    network                  = var.outside_network
    slo-nic                  = var.outside_nic
    maurice-private-endpoint = local.maurice_private_endpoint
    maurice-endpoint         = local.maurice_endpoint
    site-registration-token  = regex("content:(\\S+)", restapi_object.token.api_data.spec)[0]
    f5xc_rhel9_container     = var.f5xc_rhel9_container
  })
  filename = "manifest/${var.f5xc_cluster_name}_m${count.index}.yaml"
}
