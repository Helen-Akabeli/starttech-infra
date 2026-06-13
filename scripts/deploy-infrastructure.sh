#!/bin/bash

set -e

echo "Initializing Terraform..."

terraform init

echo "Validating Terraform..."

terraform validate

echo "Planning Infrastructure..."

terraform plan -out=tfplan

echo "Applying Infrastructure..."

terraform apply -auto-approve tfplan

echo "Infrastructure deployment completed."