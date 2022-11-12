terraform {
 backend "gcs" {
   bucket  = "6c33b0b648439490-bucket-tfstate"
   prefix  = "terraform/state/env1/gce"
 }
}

provider "google" {
  project     = var.project_id
  region      = "asia-northeast3"
}

module "gce" {
  source = "../../modules/gce"

  name = var.name
  network = var.network

}

