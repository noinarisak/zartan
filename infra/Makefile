# Author: noi.narisak
# Date: 2019-10-08
# Desc:

.ONESHELL:
.SHELL := /usr/bin/bash
.DEFAULT_GOAL := help

ROOT_PATH := $(abspath $(dir $(lastword $(MAKEFILE_LIST)))/../..)
TF_CURRENT_DIR := ${CURDIR}
TF_CURRENT_DIR_NAME := $(shell basename $(CURDIR))

TF_APP_NAME=zartan
TF_SRC_DIR=${TF_CURRENT_DIR}
TF_CREATE_TFPLAN=${TF_SRC_DIR}/${TF_APP_NAME}.create.tfplan
TF_DELETE_TFPLAN=${TF_SRC_DIR}/${TF_APP_NAME}.delete.tfplan
TF_TFVARS_PATH=${TF_SRC_DIR}/${TF_APP_NAME}.tfvars

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-16s\033[0m %s\n", $$1, $$2}'

.PHONY: set-env
set-env: ## Set up dependency files
	@echo "+ $@"
	@echo "TF_SRC_DIR: " ${TF_SRC_DIR}
	@echo "TF_TEST_LOCAL_DIR: " ${TF_TEST_LOCAL_DIR}
	@echo "TF_TFVARS_PATH: " ${TF_TFVARS_PATH}
	@echo "TF_CREATE_TFPLAN: " ${TF_CREATE_TFPLAN}
	@echo "TF_DELETE_TFPLAN: " ${TF_DELETE_TFPLAN}
	@echo "TF_CURRENT_DIR: " ${TF_CURRENT_DIR}
	@echo "TF_CURRENT_DIR_NAME: " ${TF_CURRENT_DIR_NAME}

.PHONY: clean
clean: ## Clean up
	@echo "+ $@"
	@find . -type f -name '*.tfstate*' -exec rm -f {} +
	# @find . -type f -name '*terraform.log' -exec rm -f {} +
	@find . -type f -name '*.tfplan' -exec rm -f {} +

.PHONY: create
create: prep ## Create resources
	@echo "+ $@"
	@terraform plan \
		-var-file=${TF_TFVARS_PATH} \
		-out=${TF_CREATE_TFPLAN} \
		${TF_SRC_DIR}
	@terraform apply \
		-lock=false \
		-auto-approve \
		${TF_CREATE_TFPLAN}

.PHONY: delete
delete: prep ## Delete resources !WARNING: Rarely used!
	@echo "+ $@"
	@terraform plan \
		-destroy \
		-out=${TF_DELETE_TFPLAN} \
		-var-file=${TF_TFVARS_PATH} \
		${TF_SRC_DIR}
	@terraform apply \
		-lock=false \
		-auto-approve \
		${TF_DELETE_TFPLAN}

.PHONY: prep
prep: validate ## Initiate resources
	@echo "+ $@"
	@terraform init \
		-lock=false \
		-backend-config=${TF_SRC_DIR}/${TF_APP_NAME}.backend.conf \
		${TF_SRC_DIR}

.PHONY: validate
validate: ## Validate the terraform script
	@echo "+ $@"
	@terraform -version
	@terraform init -backend=false
	@terraform validate \
		${TF_SRC_DIR}