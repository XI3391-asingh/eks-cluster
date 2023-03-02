.ONESHELL:
SHELL := /bin/bash

validate:
	istioctl manifest apply -f istio.yaml --dry-run
	
apply:
	istioctl manifest apply -f istio.yaml -y

destroy:
	istioctl uninstall --purge -y
