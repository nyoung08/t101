terraform {
 backend "gcs" {
   bucket  = "6c33b0b648439490-bucket-tfstate"
   prefix  = "terraform/state/env1/cloudsql"
  }
}

provider "google" {
  project     = var.project_id
  region      = "asia-northeast3"
}


module "cloudsql" { 
  source = "../../modules/cloudsql"
  network_id = var.network_id
  
}
