terraform {
  backend "gcs" {
    bucket  = var.gcp_bucket
    prefix = "acd-onix-gce"
  }
  required_providers {
    google = "3.76.0"
  }
}
provider "google" {
  project     = var.gcp_project
  region      = "asia-southeast1"
}