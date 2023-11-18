variable "project" {}
variable "project_number" {}
variable "project_id" {}
variable "region" {}
variable "iam_roles_cb" {
  description = "Roles that will be added to service account"
  type        = list(string)
  default     = ["roles/iam.serviceAccountUser", "roles/clouddeploy.operator", "roles/compute.networkAdmin", "roles/container.clusterAdmin", "roles/container.hostServiceAgentUser", "roles/storage.admin"]
}
variable "apis_to_activate" {
  description = "apis that will be enabled"
  type        = list(string)
  default = ["iam.googleapis.com",
    "servicenetworking.googleapis.com",
    "artifactregistry.googleapis.com",
    "container.googleapis.com",
    "clouddeploy.googleapis.com",
    "cloudbuild.googleapis.com",
    "sourcerepo.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "dns.googleapis.com",
    "sqladmin.googleapis.com",
    "sql-component.googleapis.com",
    "storage-api.googleapis.com",
    "storage-component.googleapis.com",
    "storage.googleapis.com",
    "compute.googleapis.com",
    "container.googleapis.com",
  "compute.googleapis.com"]
}
