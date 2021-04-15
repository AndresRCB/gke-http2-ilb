# GKE HTTP/2 ILB Ingress Demo

A GKE ingress demo showing an Internal HTTP(s) Load Balancer that forwards traffic to a private (i.e. No external IP) backend using HTTP2. The demo files and applications are a mix between these two documentation pages:
- [Using HTTP/2 for load balancing with Ingress](https://cloud.google.com/kubernetes-engine/docs/how-to/ingress-http2#verifying_that_your_load_balancer_supports_http2)
- [Configuring Ingress for Internal HTTP(S) Load Balancing](https://cloud.google.com/kubernetes-engine/docs/how-to/internal-load-balance-ingress)

This demo will create a project for you, so you can start from an empty cloud shell session at [shell.cloud.google.com](shell.cloud.google.com).

## Steps
1. Update the `main.tf` file with your values (folder is optional):
    - project_id= "unique-project-id"
    - billing_account = "FFFFF-FFFFF-FFFFF"
    - org_id = "333333333333"
    - [OPTIONAL] folder_id = "111111111111" 
1. Execute:
    1. `terraform init`
    1. `terraform apply -auto-approve`
    1. `gcloud container clusters get-credentials --PARAMS` command obtained from `terraform output`
    1. `kubectl apply -f .`
    1. `echo $(kubectl get ingress echomap -o template --template={{range.status.loadBalancer.ingress}}{{.ip}}{{end}})` and keep that IP address at hand
1. SSH into the test VM (`vm_instance`) using `gcloud` and the command from `terraform output`
1. Using the IP address obtained above from the ingress, execute `curl IP_ADDRESS` (you should see "request_version=2" in the response which indicates HTTP2)

## Clean-up
You have two options:
- Execute `kubectl delete -f .` and `terraform destroy -auto-approve` (takes 15 to 30 minutes to run)
- Shut down the Google Cloud Project (requires no time)