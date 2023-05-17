resource "google_compute_instance" "custom_subnet" {
  name         = "my-vm-instance"
  tags         = ["allow-ssh"]
  zone         = "europe-west1-b"
  machine_type = "e2-small"
  metadata = {
    # Shuts down Apache server
    shutdown-script = file("${path.module}/shutdown-script.sh")
  }

  network_interface {
    network    = google_compute_network.custom.id
    subnetwork = google_compute_subnetwork.custom.id
  }
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }
}