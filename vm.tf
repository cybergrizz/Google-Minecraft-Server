resource "google_compute_instance" "minecraft-vm" {
  name         = "my-vm-instance"
  tags         = ["allow-ssh"]
  zone         = "us-east1"
  machine_type = "e2-small"
  metadata = {

  }

  network_interface {
    network    = google_compute_network.minecraft-net.id
    subnetwork = google_compute_subnetwork.minecraft-subnet.id
  }
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }
}