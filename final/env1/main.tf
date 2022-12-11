terraform {
 backend "gcs" {
   bucket  = "85378d0e0de06a2d-bucket-tfstate"
   prefix  = "terraform/state/env1/"
 }
}

provider "google" {
  project     = var.project
  region      = var.region
}

module "test" {
  source = "../modules"

  project = var.project
}
