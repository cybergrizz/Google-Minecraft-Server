
resource "google_compute_subnetwork" "minecraft-subnet" {
  name          = "my-subnet"
  ip_cidr_range = "10.0.1.0/24"
  region        = "us-east1"
  network       = google_compute_network.minecraft-net.id
}

resource "google_compute_network" "minecraft-net" {
  name = "minecraft-network"
  auto_create_subnetworks = false
}
