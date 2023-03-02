.ONESHELL:
SHELL := /bin/bash

validate:
	@printf '%100s\n' | tr ' ' -
	@printf "%-40s %-10s\n" "Validating..." "eks"
	@printf '%100s\n' | tr ' ' -
	@cd 02-eks  && \
	make -s validate;
	@cd -

apply:
	@printf '%100s\n' | tr ' ' -
	@printf "%-40s %-10s\n" "Deploying..." "eks"
	@printf '%100s\n' | tr ' ' -
	@cd 02-eks  && \
	make -s apply;
	@cd -

destroy:
	@printf '%100s\n' | tr ' ' -
	@printf "%-40s %-10s\n" "Destroying..." "eks"
	@printf '%100s\n' | tr ' ' -
	@cd 02-eks  && \
	make -s destroy;
	@cd -