.ONESHELL:
SHELL := /bin/bash

validate:
	terraform init
	terraform validate
	terraform fmt -check -list=true -diff
	terraform plan -out planfile.tfplan
	terrascan scan -i terraform -t aws --iac-version v14 --non-recursive
apply:
	terraform apply -auto-approve -input=false planfile.tfplan

destroy:
	terraform destroy -auto-approve