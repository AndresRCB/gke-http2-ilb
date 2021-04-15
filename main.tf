module "gke_ingress_demo" {
    source              = "github.com/andresrcb/demo-envs/gke-private-cluster"
    project_id          = "unique-project-id"
    billing_account     = ""
    org_id              = ""
    # Folder is optional
    # folder_id           = "" 
}

output "instance_connect_command" {
  value       = module.gke_ingress_demo.instance_connect_command
  description = "Command to connect to instance via SSH"
}

output "get_cluster_credentials_command" {
  value       = module.gke_ingress_demo.get_cluster_credentials_command
  description = "Command to get cluster credentials for kubectl"
}