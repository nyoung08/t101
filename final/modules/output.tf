output "test_vpc" {
    value = google_compute_network.test_vpc
}

output "test_subnet" {
    value = google_compute_subnetwork.test_subnet
}

output "test_lb_ip" {
    value = google_compute_global_address.test_ip4lb
}

output "test_lb" {
    value = google_compute_target_http_proxy.test_httpproxy
}

output "fw4hc" {
    value = google_compute_firewall.test_fw4hc
}

output "fw4hc_tag" {
    value = google_compute_firewall.test_fw4hc.target_tags
}

output "test_mig" {
    value = google_compute_instance_group_manager.test_mig
}


