# lb forwarding rule
resource "google_compute_global_forwarding_rule" "test_forwardingrule" {
  name                  = "test-forwardingrule"
  project               = var.project
  provider              = google-beta
  ip_protocol           = "TCP"
  load_balancing_scheme = "EXTERNAL"
  port_range            = "80"
  target                = google_compute_target_http_proxy.test_httpproxy.id
  ip_address            = google_compute_global_address.test_ip4lb.id
}

# lb target http proxy
resource "google_compute_target_http_proxy" "test_httpproxy" {
  name     = var.lbname
  project  = var.project
  provider = google-beta
  url_map  = google_compute_url_map.test_urlmap.id
}

# lb url map
resource "google_compute_url_map" "test_urlmap" {
  name            = "test-url-map"
  project         = var.project
  provider        = google-beta
  default_service = google_compute_backend_service.test_backend.id
}

# lb backend service
resource "google_compute_backend_service" "test_backend" {
  name                    = "test-backend-service"
  project                 = var.project
  provider                = google-beta
  protocol                = "HTTP"
  load_balancing_scheme   = "EXTERNAL"
  port_name               = "test-port"
  timeout_sec             = 10
  enable_cdn              = false
  health_checks           = [google_compute_health_check.test_hc.id]
  backend {
    group           = google_compute_instance_group_manager.test_mig.instance_group
    balancing_mode  = "UTILIZATION"
    capacity_scaler = 1.0
  }
}
