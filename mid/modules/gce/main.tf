data "google_compute_default_service_account" "default" {
}

resource "google_compute_instance" "default" {
  name         = var.name
  machine_type = var.machine_type
  zone         = var.zone

  tags = var.tags

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    network = var.network
    access_config {
    }
    subnetwork = var.subnetwork
  }

  metadata_startup_script = <<-EOF
    #!/bin/bash
sudo apt-get update -y
sudo apt-get install default-mysql-client -y
curl -o cloud_sql_proxy https://dl.google.com/cloudsql/cloud_sql_proxy.linux.amd64
sudo chmod +x cloud_sql_proxy
./cloud_sql_proxy -instances=${proejct_id}:asia-northeast3:private-ip-sql-instance=tcp:3306 &
  EOF


  service_account {
    email  = data.google_compute_default_service_account.default.email
    scopes = ["cloud-platform"]
  }
}
