.ONESHELL:
SHELL := /bin/bash

validate:
	@printf '%100s\n' | tr ' ' -
	@printf "%-40s %-10s\n" "Validating..." "istio"
	@printf '%100s\n' | tr ' ' -
	@cd 01-istio  && \
	make -s validate;
	@cd -

apply:
	@printf '%100s\n' | tr ' ' -
	@printf "%-40s %-10s\n" "Deploying..." "istio"
	@printf '%100s\n' | tr ' ' -
	@cd 01-istio  && \
	make -s apply;
	@cd -

destroy:
	@printf '%100s\n' | tr ' ' -
	@printf "%-40s %-10s\n" "Destroying..." "istio"
	@printf '%100s\n' | tr ' ' -
	@cd 01-istio  && \
	make -s destroy;
	@cd -