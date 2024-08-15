# Marketplace-CICD-Pipline

This repository holds the pipeline scripts to setup the environment on Google cloud.
After enabling necessary APIs using the [MarketPlace-API repository](https://github.com/JKA-Consulting/MarketPlace-API), we then use the cloudbuild.yaml to deploy a GCE instance (upon which Jenkins is installed) for our CI/CD processes.
The script for setting up the GCE and installing Jenkins on the instance is in the terraform (main.tf) script.
Jenkins will then be setup/configured to use Jenkinsfile to deploy kubernetes infrastructure which is on the [Marketplace-Infrastructure repository](https://github.com/JKA-Consulting/Marketplace-Infrastructure)

## Tools Used
- Terraform
- Jenkins
- Cloudbuild