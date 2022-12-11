provider "google" {
  project     = var.project
  region      = "asia-northeast3"
}

# create bucke name randomly
resource "random_id" "bucket_prefix" {
  byte_length = 8
}


resource "google_storage_bucket" "backend" {
  name          = "${random_id.bucket_prefix.hex}-bucket-tfstate"
  force_destroy = true
  location      = "asia-northeast3"
  storage_class = "STANDARD"
  versioning {
    enabled = true
  }
}


resource "null_resource" "bucket_name" {
  provisioner "local-exec" {
    command = "env"
    environment = {
      TF_VAR_remotebucketname = "${google_storage_bucket.backend.id}"
    }
  }
}
