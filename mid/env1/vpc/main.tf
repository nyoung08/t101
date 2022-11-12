terraform {
 backend "gcs" {
   bucket  = var.remotebucketname
   prefix  = "terraform/state/env1/vpc"
 }
}

provider "google" {
  project     = var.project_id
  region      = "asia-northeast3"
}

module "vpc" { 
  source = "../../modules/vpc"

  project_id = var.project_id  
  network_name = var.network_name
  subnets = var.subnets
  rules = var.rules

}


