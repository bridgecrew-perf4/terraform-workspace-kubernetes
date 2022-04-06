default: up update-kubeconfig use-context
up:
  terraform apply -auto-approve
down:
  terraform destroy -auto-approve

update-kubeconfig:
  doctl kubernetes cluster kubeconfig save main
use-context:
	kubectl config use-context do-fra1-main

list-doks-versions:
  doctl kubernetes options versions
