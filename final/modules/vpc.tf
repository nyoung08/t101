# vpc
resource "google_compute_network" "test_vpc" {
  name                    = var.vpcname
  project                 = var.project
  provider                = google-beta
  auto_create_subnetworks = false
}

# subnet for compute engine
resource "google_compute_subnetwork" "test_subnet" {
  name          = var.subnetname
  project       = var.project
  provider      = google-beta
  ip_cidr_range = var.iprange
  region        = var.region
  network       = google_compute_network.test_vpc.id
}

# reserve global ip address for lb frontend
resource "google_compute_global_address" "test_ip4lb" {
  provider = google-beta
  project = var.project
  name     = "ip4lb"
}

# firewall rule to allow access from health check ranges
resource "google_compute_firewall" "test_fw4hc" {
  name          = "fw4hc"
  provider      = google-beta
  project       = var.project
  direction     = "INGRESS"
  network       = google_compute_network.test_vpc.id
  source_ranges = ["130.211.0.0/22", "35.191.0.0/16"]
  allow {
    protocol = "tcp"
  }
  target_tags = ["allow-health-check"]
}
