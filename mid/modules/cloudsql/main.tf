resource "google_compute_global_address" "private_ip_address" {
  name          = "private-ip-address"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = var.network_id
}

resource "google_service_networking_connection" "default" {
  network                 = var.network_id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_address.name]
}

resource "google_sql_database_instance" "sqlinstance" {
  name             = "private-ip-sql-instance"
  region           = var.region
  database_version = var.sqlversion

  depends_on = [google_service_networking_connection.default]

  settings {
    tier = var.tier
    ip_configuration {
      ipv4_enabled    = "false"
      private_network = var.network_id
    }
  }
  deletion_protection = false # set to true to prevent destruction of the resource
}

resource "google_compute_network_peering_routes_config" "peering_routes" {
  peering              = google_service_networking_connection.default.peering
  network              = var.network_id
  import_custom_routes = true
  export_custom_routes = true
}


