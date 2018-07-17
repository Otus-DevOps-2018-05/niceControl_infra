resource "google_compute_http_health_check" "default" {
  name               = "healthcheck"
  port               = 9292
  request_path       = "/"
  check_interval_sec = 2
  timeout_sec        = 2
}

resource "google_compute_target_pool" "default" {
  name          = "instance-pool"
  instances     = ["${google_compute_instance.app.*.self_link}"]
  health_checks = ["${google_compute_http_health_check.default.name}"]
}

resource "google_compute_forwarding_rule" "default" {
  name       = "reddit-forward"
  target     = "${google_compute_target_pool.default.self_link}"
  port_range = "9292"
}
